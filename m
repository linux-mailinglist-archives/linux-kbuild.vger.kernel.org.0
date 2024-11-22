Return-Path: <linux-kbuild+bounces-4798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFC9D6106
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 16:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811E628185C
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 15:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362077E583;
	Fri, 22 Nov 2024 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="Zjq3YLkI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA672BB04
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732287687; cv=none; b=kAXI+jpllSKP6Qrn2Ghm0JkfQ4lYUjjr3PQPqhrFNPxYxYJ4eLbQZJ4UHZuLYAxRi4uA7vaGn3o5ENyUKWyg+tOOCbC+Ee32VgUqD3SP2tz4LR2KUkzIxCCGFO9gt/OOU3oBNwjlNyncFY0eRSWCgeEr9pymv9vjz3AoILRA0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732287687; c=relaxed/simple;
	bh=LGlA2BJ6M4wcH8x3ehp6Ae86MbGVASEEAKRDxAIa6ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2rxOEdnyS3ZkNPfMxsM/OHlnA/yo6dyelG2oS/GRmkSOu97tbZAgtXHB/aYc0tDNJapMvmEkVsBJUfBLHF/jKiBKP2kZl5+W1gYwatohHEm1Q5u3VWaL+wQ9OED4Sna/V6pqOrtiqj3vuSpRsfyrImvvMdDJRuB/zYrttNw5mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=Zjq3YLkI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so26909911fa.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 07:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1732287681; x=1732892481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkKS86uYr5GOGT/zx/7/Fct9WFN0ZnbAL7sL38YJfBQ=;
        b=Zjq3YLkIahqIZ0Ns+rSQupk0n1hjlUouWUJLkMURUYpki5rtJQboVbGq9ioWddvuVh
         M1JjXKTcU/t3PzmQy3se05/6kdr9dcgZpAgNZfMeNS5CSLB1lZBXWk5sF58a0tWdLNPw
         Juza2aFasXLSVGmF4Bqst4ZEw33pjMibXpDmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732287681; x=1732892481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkKS86uYr5GOGT/zx/7/Fct9WFN0ZnbAL7sL38YJfBQ=;
        b=a83dqwQHECC6VL1A3Ln/E4RqchXpcw9q6QH5kqlwulYPvyvGYoUn08AnpW18/7qsII
         bG/cTMlN7SbEIogKxaLMAATmPp+O4eQyoYhPehMKx5hUsMTsu2CimeJrWOSXKWgj7bHr
         drKlhea1OznKVORQvgKg3RFtKo5UZVB6eAskcKjt578eGDQeO5uKV/jeAaBpBBkZIBnr
         N27K0zlbZ0G9hP7tRp3P/GNL9AIYSvnyC/V0ksqIHaOb5bdbp8qSpA+IwmgyM652jibO
         QqBl2F9sSwfKWpE+deN8Ws+1WwvAxvRsEoh0YnSL23Ir2sVAYTFs6kPjjT8X0YiP1Djg
         8EbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpnNSga7Q/uQHf0VFxxIkTLpKA8gBTKf4zZNSp2mipcv5UNRRKr9BCK5MNBUsbZS/zs2eGw4Q1hDQGsbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YygyfP1svZCAiNMQ+/JKxu3tS+GfYKnx+jU7P3dml6SRjEwu4UL
	PlE/qHz0oWDr/odb678rZcO3ffM9OTvZQ/TjbyKPT2iO6UxlBMUOz8wZj7b5vyGVQ+qEF3XACPF
	MaZk=
X-Gm-Gg: ASbGncvNoPrOV1mYsGoJK9MvpTCxIkgSPxyKR0f2yL4uQy53R39vz8GigubbRsCsiYW
	pkwYfWp91AcqrGNPW4OeeRZ0hJBiMbKMIFeine22ziXi+dSr4eRM+d0wbTxndJ+JvVCz86IHvvH
	tkQEyArPitlyRn2DYgzuVRhYWTj1UUxiq3Vv4E0GIIuMWyPnASzBo2KQbw1pzdQDTZ8SRHT4h5J
	ksymB/hB2JPT6nl5k5sbgYa1DF9NtOtBiASiLHRAYfyy452htc=
X-Google-Smtp-Source: AGHT+IFGTIvfkpX3QBjy/VFmi0bhipJmqhaXLPh75RcEoQVJ/F8S/PCowxrPkp5+Vbx3GTC7Ml9I5g==
X-Received: by 2002:a05:6512:1290:b0:53d:a41c:4efe with SMTP id 2adb3069b0e04-53dd39b2c69mr1752978e87.36.1732287680635;
        Fri, 22 Nov 2024 07:01:20 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451433sm413998e87.68.2024.11.22.07.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:01:20 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jeff King <peff@peff.net>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sean Christopherson <seanjc@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v4] setlocalversion: work around "git describe" performance
Date: Fri, 22 Nov 2024 16:00:37 +0100
Message-ID: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Contrary to expectations, passing a single candidate tag to "git
describe" is slower than not passing any --match options.

  $ time git describe --debug
  ...
  traversed 10619 commits
  ...
  v6.12-rc5-63-g0fc810ae3ae1

  real    0m0.169s

  $ time git describe --match=v6.12-rc5 --debug
  ...
  traversed 1310024 commits
  v6.12-rc5-63-g0fc810ae3ae1

  real    0m1.281s

In fact, the --debug output shows that git traverses all or most of
history. For some repositories and/or git versions, those 1.3s are
actually 10-15 seconds.

This has been acknowledged as a performance bug in git [1], and a fix
is on its way [2]. However, no solution is yet in git.git, and even
when one lands, it will take quite a while before it finds its way to
a release and for $random_kernel_developer to pick that up.

So rewrite the logic to use plumbing commands. For each of the
candidate values of $tag, we ask: (1) is $tag even an annotated
tag? (2) Is it eligible to describe HEAD, i.e. an ancestor of
HEAD? (3) If so, how many commits are in $tag..HEAD?

I have tested that this produces the same output as the current script
for ~700 random commits between v6.9..v6.10. For those 700 commits,
and in my git repo, the 'make -s kernelrelease' command is on average
~4 times faster with this patch applied (geometric mean of ratios).

For the commit mentioned in Josh's original report [3], the
time-consuming part of setlocalversion goes from

$ time git describe --match=v6.12-rc5 c1e939a21eb1
v6.12-rc5-44-gc1e939a21eb1

real    0m1.210s

to

$ time git rev-list --count --left-right v6.12-rc5..c1e939a21eb1
0       44

real    0m0.037s

[1] https://lore.kernel.org/git/20241101113910.GA2301440@coredump.intra.peff.net/
[2] https://lore.kernel.org/git/20241106192236.GC880133@coredump.intra.peff.net/
[3] https://lore.kernel.org/lkml/309549cafdcfe50c4fceac3263220cc3d8b109b2.1730337435.git.jpoimboe@kernel.org/

Reported-by: Sean Christopherson <seanjc@google.com>
Closes: https://lore.kernel.org/lkml/ZPtlxmdIJXOe0sEy@google.com/
Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Closes: https://lore.kernel.org/lkml/309549cafdcfe50c4fceac3263220cc3d8b109b2.1730337435.git.jpoimboe@kernel.org/
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
v4:

- Switch the logic to make use of the return values from try_tag,
  instead of asking whether $count has been set.

- Update a comment.

- Drop T-b tag from Josh as I think this changes the flow sufficiently
  from the version he tested. I have repeated my tests, with the same
  functional and performance result as indicated in the commit log.

v3: https://lore.kernel.org/lkml/20241118110154.3711777-1-linux@rasmusvillemoes.dk/

 scripts/setlocalversion | 59 +++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 38b96c6797f4..cde45d92cc0b 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -30,6 +30,27 @@ if test $# -gt 0 -o ! -d "$srctree"; then
 	usage
 fi
 
+try_tag() {
+	tag="$1"
+
+	# Is $tag an annotated tag?
+	[ "$(git cat-file -t "$tag" 2> /dev/null)" = tag ] || return 1
+
+	# Is it an ancestor of HEAD, and if so, how many commits are in $tag..HEAD?
+	# shellcheck disable=SC2046 # word splitting is the point here
+	set -- $(git rev-list --count --left-right "$tag"...HEAD 2> /dev/null)
+
+	# $1 is 0 if and only if $tag is an ancestor of HEAD. Use
+	# string comparison, because $1 is empty if the 'git rev-list'
+	# command somehow failed.
+	[ "$1" = 0 ] || return 1
+
+	# $2 is the number of commits in the range $tag..HEAD, possibly 0.
+	count="$2"
+
+	return 0
+}
+
 scm_version()
 {
 	local short=false
@@ -64,30 +85,27 @@ scm_version()
 	# If a localversion* file exists, and the corresponding
 	# annotated tag exists and is an ancestor of HEAD, use
 	# it. This is the case in linux-next.
-	tag=${file_localversion#-}
-	desc=
-	if [ -n "${tag}" ]; then
-		desc=$(git describe --match=$tag 2>/dev/null)
-	fi
-
+	if [ -n "${file_localversion#-}" ] && try_tag "${file_localversion#-}" ; then
+		:
 	# Otherwise, if a localversion* file exists, and the tag
 	# obtained by appending it to the tag derived from
 	# KERNELVERSION exists and is an ancestor of HEAD, use
 	# it. This is e.g. the case in linux-rt.
-	if [ -z "${desc}" ] && [ -n "${file_localversion}" ]; then
-		tag="${version_tag}${file_localversion}"
-		desc=$(git describe --match=$tag 2>/dev/null)
-	fi
-
+	elif [ -n "${file_localversion}" ] && try_tag "${version_tag}${file_localversion}" ; then
+		:
 	# Otherwise, default to the annotated tag derived from KERNELVERSION.
-	if [ -z "${desc}" ]; then
-		tag="${version_tag}"
-		desc=$(git describe --match=$tag 2>/dev/null)
+	elif try_tag "${version_tag}" ; then
+		:
+	else
+		count=
 	fi
 
-	# If we are at the tagged commit, we ignore it because the version is
-	# well-defined.
-	if [ "${tag}" != "${desc}" ]; then
+	# If we are at the tagged commit, we ignore it because the
+	# version is well-defined. If none of the attempted tags exist
+	# or were usable, $count is empty, so there is no count to
+	# pretty-print, but we can and should still append the -g plus
+	# the abbreviated sha1.
+	if [ "${count}" != 0 ]; then
 
 		# If only the short version is requested, don't bother
 		# running further git commands
@@ -95,14 +113,15 @@ scm_version()
 			echo "+"
 			return
 		fi
+
 		# If we are past the tagged commit, we pretty print it.
 		# (like 6.1.0-14595-g292a089d78d3)
-		if [ -n "${desc}" ]; then
-			echo "${desc}" | awk -F- '{printf("-%05d", $(NF-1))}'
+		if [ -n "${count}" ]; then
+			printf "%s%05d" "-" "${count}"
 		fi
 
 		# Add -g and exactly 12 hex chars.
-		printf '%s%s' -g "$(echo $head | cut -c1-12)"
+		printf '%s%.12s' -g "$head"
 	fi
 
 	if ${no_dirty}; then
-- 
2.47.0


