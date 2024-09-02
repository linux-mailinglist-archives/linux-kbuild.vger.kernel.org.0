Return-Path: <linux-kbuild+bounces-3318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37D968BA2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8BAB2837AE
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532211A304A;
	Mon,  2 Sep 2024 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWLB+Q0D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661F1A3035;
	Mon,  2 Sep 2024 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293341; cv=none; b=uftNwXb0mmzhM0J/pIzK9dxsywK5qCA4ROJfH7fkpDCKcdHx7t7hhQYl1x35BEpC51OSJN9jds+1mxsuzYXAIXXzWgO9rTn7WiRswh3sxOcXDEYsd2sdE7ntlgdR/uP/dfnRYVAabsY3rj7dBk2qS2e0ymdRkzCaDQ1Sy+pSQvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293341; c=relaxed/simple;
	bh=qjaCILSPADp+QF5J8NfEpPzn45HQksLGDvClBftKjxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oREZMyWqIuEBY3Yk3hufznD9vmen55V+DN4SaaZ3uUb9Gn9LcAs6ylmeY+hQp7TAnWRkuQZ2ZY9UuLquqFnFKn6OiSEqWsS6qUQyaytOIvtiqcSPRZGSWMccFhvrWqvn5yWzi/QMfaB/IxVzacDqzVorkJgerZYKxJlDYlcRfzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWLB+Q0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E819BC4CEC2;
	Mon,  2 Sep 2024 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725293340;
	bh=qjaCILSPADp+QF5J8NfEpPzn45HQksLGDvClBftKjxg=;
	h=From:To:Cc:Subject:Date:From;
	b=WWLB+Q0DXyI4j5whUEzMRNcNDwks40IyMPYrEC+3st9ouqw876MbzLCFR5AV/bJAm
	 rOnIvuIKhF1SIkj3seZyjQeQoceuU6eLvmheGPlNU8wUp8axpg0DDjHhMB43DZ4f9g
	 YhZhVJDWn17+l/IIKMZ+qew7Xm8IbgGHGS2b4I+K9wChy+2c6LimaORsPrOHeOtS5U
	 aTHVgKzbbNfMIuIXMooIRuc/5+q5i+Q7HMvITc7B5B9u89XfWIOURJl0Ol/BtC1XXL
	 kLK4jUDHmJ/9+ppJThWmtoimMwDrcZMVqMgEq9rbCTPUd1zKQf2UoDB1UX82V5By57
	 j1+UNkCEDOYSQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v2] kbuild: pahole-version: improve overall checking and error messages
Date: Mon,  2 Sep 2024 18:08:28 +0200
Message-ID: <20240902160828.1092891-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like patch "rust: suppress error messages from
CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT" [1], do not assume the file existing
and being executable implies executing it will succeed.

Instead, bail out if executing it fails for any reason, as well as if
the program does not print to standard output what we are expecting from
`pahole --version`. The script needs to ensure that it always returns
an integer, since its output will go into a Kconfig `int`-type symbol.

In addition, check whether the program exists first, and provide
error messages for each error condition, similar to how it is done in
e.g. `scripts/rust_is_available.sh`.

For instance, currently `pahole` may be built for another architecture
or may be a program we do not expect that fails:

    $ echo 'bad' > bad-pahole
    $ chmod u+x bad-pahole
    $ make PAHOLE=./bad-pahole defconfig
    ...
    ./bad-pahole: 1: bad: not found
    init/Kconfig:112: syntax error
    init/Kconfig:112: invalid statement

With this applied, we get instead:

    ***
    *** Running './bad-pahole' to check the pahole version failed with
    *** code 127. pahole will not be used.
    ***
    ...
    $ grep CONFIG_PAHOLE_VERSION .config
    CONFIG_PAHOLE_VERSION=0

Similarly, `pahole` currently may be a program that returns successfully,
but that does not print the version that we would expect:

    $ echo 'echo' > bad-pahole
    $ chmod u+x bad-pahole
    $ make PAHOLE=./bad-pahole defconfig
    ...
    init/Kconfig:114: syntax error
    init/Kconfig:114: invalid statement

With this applied, we get instead:

    ***
    *** pahole './bad-pahole' returned an unexpected version output.
    *** pahole will not be used.
    ***
    ...
    $ grep CONFIG_PAHOLE_VERSION .config
    CONFIG_PAHOLE_VERSION=0

Finally, with this applied, if the program does not exist, we get:

    $ make PAHOLE=./bad-pahole defconfig
    ...
    ***
    *** pahole './bad-pahole' could not be found. pahole will not be used.
    ***
    ...
    $ grep CONFIG_PAHOLE_VERSION .config
    CONFIG_PAHOLE_VERSION=0

Link: https://lore.kernel.org/rust-for-linux/20240727140302.1806011-1-masahiroy@kernel.org/ [1]
Co-developed-by: Nicolas Schier <nicolas@fjasle.eu>
Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
v1: https://lore.kernel.org/all/20240728125527.690726-1-ojeda@kernel.org/
v2:

Reworked to catch successful programs that may not output what we expect from
pahole as well as to do the checking step-by-step (for better error messages).

I didn't change the regular expression to reduce the changes (except adding
`p`) -- it can be improved separately.

Also, please note that I added Nicolas as co-author since he proposed part of
the solution, but he has not formally signed off yet.

 scripts/pahole-version.sh | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/scripts/pahole-version.sh b/scripts/pahole-version.sh
index f8a32ab93ad1..cdb80a3d6e4f 100755
--- a/scripts/pahole-version.sh
+++ b/scripts/pahole-version.sh
@@ -5,9 +5,33 @@
 #
 # Prints pahole's version in a 3-digit form, such as 119 for v1.19.

-if [ ! -x "$(command -v "$@")" ]; then
-	echo 0
+set -e
+trap "echo 0; exit 1" EXIT
+
+if ! command -v "$@" >/dev/null; then
+	echo >&2 "***"
+	echo >&2 "*** pahole '$@' could not be found. pahole will not be used."
+	echo >&2 "***"
+	exit 1
+fi
+
+output=$("$@" --version 2>/dev/null) || code=$?
+if [ -n "$code" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Running '$@' to check the pahole version failed with"
+	echo >&2 "*** code $code. pahole will not be used."
+	echo >&2 "***"
+	exit 1
+fi
+
+output=$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9]+)/\1\2/p')
+if [ -z "${output}" ]; then
+	echo >&2 "***"
+	echo >&2 "*** pahole '$@' returned an unexpected version output."
+	echo >&2 "*** pahole will not be used."
+	echo >&2 "***"
 	exit 1
 fi

-"$@" --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/'
+echo "${output}"
+trap EXIT

base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
--
2.46.0

