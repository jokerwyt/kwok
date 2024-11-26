package metrics

import "github.com/prometheus/client_golang/prometheus"

var (
	PodStagedPlayed = prometheus.NewCounter(prometheus.CounterOpts{
		Name: "kwok_pod_staged_played_total",
		Help: "Total number of staged pods played",
	})
	PodPreprocessed = prometheus.NewCounter(prometheus.CounterOpts{
		Name: "kwok_pod_preprocessed_total",
		Help: "Total number of pods preprocessed",
	})
	customHistogram = prometheus.NewHistogram(prometheus.HistogramOpts{
		Name:    "kwokcontroller_custom_metric_duration_seconds",
		Help:    "Duration of custom events in seconds",
		Buckets: prometheus.DefBuckets,
	})
)

func init() {
	prometheus.MustRegister(PodStagedPlayed, PodPreprocessed)
}
