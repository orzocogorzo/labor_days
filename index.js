document.addEventListener("DOMContentLoaded", function () {
    const week = document.getElementById("week");
    const days = Array.apply(null, week.getElementsByClassName("week-day"));
    days.forEach((day, i) => {
        day.addEventListener("click", function () {
            ajax.load(i)
                .then(onWorkers, onError);

            days.forEach(day => day.classList.remove("selected"));
            day.classList.add("selected");
        });
    });
    days[0].classList.add("selected");

    const canvas = d3.select("#canvas");
    const workspace = canvas.select("#workspace");

    const ajax = new Ajax(); 
    ajax.load().then(onWorkers, onError);

    function onWorkers (workers) {
        var chairs = workspace
            .selectAll(".chair")
            .data(workers);

        chairs
            .transition()
            .delay(200)
            .duration(500)
            .style("fill", function (worker) {
                return worker.works ? "steelblue" : "gray";
            }).text(function (worker) {
                return worker.works ? worker.name : "";
            });
    }

    function onError () {
        console.error("Error while loading workers data.");
    }
});


const Ajax = (function () {

    var callback = function () {console.log.apply(null, arguments)}
    var fallback = function () {console.error.apply(null, arguments)}
 
    return function () {
        const self = this;
        this.load = function (day) {
            day = day || 0;
            const ajax = new XMLHttpRequest();
            ajax.open("GET", `http://localhost:5000/rest/workers/${day}`);
            ajax.onreadystatechange = function () {
                if (this.readyState == 4) {
                    if (this.status == 200) {
                       self.callback(JSON.parse(this.response));
                    } else {
                        self.fallback(this.response);
                    }
                }
            }
            ajax.send();
            return this;
        }

        this.then = function (callback, fallback) {
            this.callback = callback || this.callback;
            this.fallback = fallback || this.fallback;
        }
    }
})();
