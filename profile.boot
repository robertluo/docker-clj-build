(configure-repositories!
  (fn [{:keys [name id] :as repo-map}]
    (if-let [name (or name id)]
      (let [name (clojure.string/upper-case name)
            username (get-sys-env (str name "_USER"))
            password (get-sys-env (str name "_PASS"))
            info (when (and username password) {:username username :password password})]
        (merge repo-map info))
      repo-map)))
