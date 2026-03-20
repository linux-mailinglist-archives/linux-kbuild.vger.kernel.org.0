Return-Path: <linux-kbuild+bounces-12101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKDBFamSvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12101-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 683402DF752
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DAEF303D990
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C203E7155;
	Fri, 20 Mar 2026 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPj7X55w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB03EAC6C
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031381; cv=none; b=mAmOuTYVf40FZJ1BKUbu8X8afMA5dVmSa8bYQt4srRk8L79WWIqqZHUMalIoJckYsAOzthoO69RP2GAgKFIwtSZ71eC8ZMr9M/FKCklyzHWzCeMwB5xYtwP6Wjb6LTiNyh5zdHgdDICPh7jViU3EuVgTT9COyFaUo7Intz9wU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031381; c=relaxed/simple;
	bh=CNCvVk8M6cXHeuhKo9e9N7wSVZT50Sy8YkEIIck7oxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=licA1R7OZDZEGZqSGETnYQBhhw2gpjdSpEGmM1S9TzcSfPdRiG5FrOsXb4E3vlqgtEGlYjBTD/qJHtFRLSbHPXlasgdD5OQbftB/w8ibp/ZCMdP6J9n3lu61PAln9SJdAsGumBhrzuCoByEhcvYnX40bQ1/ozOzA5fl0yLiPgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WPj7X55w; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so19059285e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031378; x=1774636178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhj6iK9mxvXqiBpyK8tX4BgiBzUUg/ToJ+/LCEiKyk8=;
        b=WPj7X55w+Y6s2MWVQlCI8Yj+owhrOT5jlZGwcgAsQPKRj/nN8t4LIfKBwGWF116k/D
         4WSe26YFYdjuJbeBRaQld/VIH7UhTEDwO8ZmXwRAlvdtjfJdBfEn9DlV4W4C4kA8o911
         VVNQs4Wanf5RXLm7aLZrBmklaSou2Hd33vuJRHg963dfJDpZWhKPLeKcEnzV7cSc0Lp+
         M2LCIcTIq/qca4eghkMvRMzGlMaFuGTXJQRsl/lSZM5CRW5clBw0EBoZ0EPC2DE7+MLX
         wOrZ0ZMm2wxbIKABkLXqJzZbTPrp17bvIBFdVeGj24QFGexkZwmhwzECx4RcN69XkNr6
         /31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031378; x=1774636178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xhj6iK9mxvXqiBpyK8tX4BgiBzUUg/ToJ+/LCEiKyk8=;
        b=YT5ikAmUhL2SCcXeqLINGWokt8+Cgtz0pa77O+btUYsALYgrX89uwsbmWoUrBmqWyT
         yR0+PTMsIZxF1jVq91Sbqp0X/qw4XtxascqPjaN0GHH6dTuJKIaWj9egoPbxoNm9MMd2
         yJXvkcHEuFHIJ76rrt+8XLDC2nWBjfOjBTmQ33NeObi+jt3mPjx0sv0BOuGzRZGtCGZd
         kwfM27YahiehkkcQFbVL5+XVId3w8xT00ZcmIALmGtvXZ01El7JEiYpsuMyo+M1DroYQ
         FLdMvhcN372S2lFwNHgnzqdXbNrq+43lbzkWfeQpj+jSPn3nIrRU5Lfpk3dRv3wcBM5F
         xp5A==
X-Forwarded-Encrypted: i=1; AJvYcCWUgPD+9++vqBbHF3qWJfyk/7bXo/803zYuZqW1ymVl2FGz6kvWoSkCsZshQfoFqMn0uilaorIosi2WvPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLghR4qcgbYtpb9KLieBmg6skeUC8frVuXQUPhAKjA2LC1D5gW
	HBPJtxHb1eZ7zOIFlUTVmTRI/QqLfEqQU5mJgQXrSdbmfwOx4bzX2+hviYhOKUjxkXA=
X-Gm-Gg: ATEYQzzsIGD0RqWsnfNaDxyrDOvIdx9AGx8cZcC+StH8ogRNliyJB82dpmU1fw+VDIx
	YmIRwI7hWTfEUTuyuydsWSJeLMwroFGyLFPGupxGBr2nEcTP6fulkLIVJ+UOum43HcSeqf7JsNs
	tA5gaBMrgXdXmo3ph/4GHruiwGQD86UZr22KHEsNGlzPaHLbxiRVp04K37psf/L6aN5SlKeclHn
	2PbuT9ZlaD9orO9JEkBIS4dyRKCYvtaOkT7TnJebC8sk+jB5gytoK/eEFtxhdYt1cH2TlmPaE5k
	0PrT7r/zEYY57L99h1M91OZlxpxvlgKzs6ojmaY7qwO3xPutWDdrIMY/tUKPVfEQj0sEAaLqhkA
	YP09kzZUnZ/oLl6yt5HmQNKav9LZKW2YFWjggPbQ+q8hVJRzCJE6I0q5uMIlZ28eg9gydkhTgD6
	dOrCfs1WQzBA==
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr62060455e9.11.1774031378372;
        Fri, 20 Mar 2026 11:29:38 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm1903545d50.6.2026.03.20.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:37 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:19 -0300
Subject: [PATCH 4/6] selftests/run_kselftest.sh: Allow choosing per-test
 log directory
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-4-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=3675;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=CNCvVk8M6cXHeuhKo9e9N7wSVZT50Sy8YkEIIck7oxw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGta/eA4GB0RU2QzWdbG6D7/tTx92qA+t+0kDc8F5W+598SHiw+WPZ/kiCt8flBMjTE4/+7KpIW
 5TyEdF0vKTwA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12101-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,run_kselftest.sh:url,runner.sh:url]
X-Rspamd-Queue-Id: 683402DF752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The --per-test-log option currently hard-codes /tmp. However, the system
under test will most likely have tmpfs mounted there. Since it's not clear
which filenames the log files will have, the user should be able to specify
a persistent directory to store the logs. Keeping those logs are important
because the run_kselftest.sh runner will only yield KTAP output, trimming
information that is otherwise available through running individual tests
directly.

Allow --per-test-log to take an optional directory argument. Keep the
existing behaviour when the option is passed without an argument, but if
a directory is provided, create it if needed, reject non-directory paths
and non-writable directories, canonicalize it, and have runner.sh write
per-test logs there instead of /tmp.

This also makes relative paths safe by resolving them before the runner
changes into a collection directory.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/kselftest/runner.sh |  3 ++-
 tools/testing/selftests/run_kselftest.sh    | 30 +++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..6e13818fe433 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -6,6 +6,7 @@ export skip_rc=4
 export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
+export per_test_log_dir=/tmp
 export RUN_IN_NETNS=
 
 # Defaults for "settings" file fields:
@@ -189,7 +190,7 @@ run_many()
 		BASENAME_TEST=$(basename $TEST)
 		test_num=$(( test_num + 1 ))
 		if [ -n "$per_test_logging" ]; then
-			logfile="/tmp/$BASENAME_TEST"
+			logfile="$per_test_log_dir/$BASENAME_TEST"
 			cat /dev/null > "$logfile"
 		fi
 		if [ -n "$RUN_IN_NETNS" ]; then
diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 5f7bce9a640b..fdbbe5b8b079 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -22,7 +22,7 @@ usage()
 	cat <<EOF
 Usage: $0 [OPTIONS]
   -s | --summary		Print summary with detailed log in output.log (conflict with -p)
-  -p | --per-test-log		Print test log in /tmp with each test name (conflict with -s)
+  -p | --per-test-log [DIR]	Print test log in /tmp or DIR with each test name (conflict with -s)
   -t | --test COLLECTION:TEST	Run TEST from COLLECTION
   -S | --skip COLLECTION:TEST	Skip TEST from COLLECTION
   -c | --collection COLLECTION	Run all tests from COLLECTION
@@ -50,7 +50,33 @@ while true; do
 			shift ;;
 		-p | --per-test-log)
 			per_test_logging=1
-			shift ;;
+			if [ -n "$2" ] && [ "${2#-}" = "$2" ]; then
+				per_test_log_dir="$2"
+				if [ -e "$per_test_log_dir" ] && [ ! -d "$per_test_log_dir" ]; then
+					echo "Per-test log path is not a dir:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				if [ ! -d "$per_test_log_dir" ] && \
+				   ! mkdir -p "$per_test_log_dir"; then
+					echo "Could not create log dir:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				per_test_log_dir=$(cd "$per_test_log_dir" && pwd -P)
+				if [ -z "$per_test_log_dir" ]; then
+					echo "Could not resolve per-test log directory" >&2
+					exit 1
+				fi
+				if [ ! -w "$per_test_log_dir" ]; then
+					echo "Per-test log dir is not writable:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				shift 2
+			else
+				shift
+			fi ;;
 		-t | --test)
 			TESTS="$TESTS $2"
 			shift 2 ;;

-- 
2.53.0


