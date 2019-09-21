docker-compose run --rm research_template bash -c "cd /scripts && bash build_test_report.sh"

test_report="LONG_NAME_NO_ONE_WILL_EVER_TYPE"

xdg-open reports/$test_report".html" || open reports/$test_report".html"&
sleep 1
rm -f reports/$test_report*