Return-Path: <linux-kbuild+bounces-12100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMw3NNKTvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12100-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:37:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3E2DF85F
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 553FC31F118F
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6227C3E8672;
	Fri, 20 Mar 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YffsH8b7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057F3E958A
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031378; cv=none; b=pplxEESos+JEnMSbideC1Bo0j6se2I8Lv8g/PcJjilquPmBzfg5wa3Zn/LNazumpZHtKLvNGH0PZ3UXi6rRVt1Snx0TS5TpLVfi6oJTvahqn/buAcoHrZuyzr3hFjncnWXlq9h6nQdEMJcOuDJvUAeTajT+bMcP2SZKPwr/WElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031378; c=relaxed/simple;
	bh=RrVGneoI97HAbFh0po9veu/6l2CV4YOVmpXZ5Qd0yT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNk3wG/OxvRFO35yesNri2BF8TroZoQ/qdKSApMshjd7NfnA0B3LU7TuI3m9ZPr9RtjJ64r6VpZ2S6NtKReEawdE2KyEfRF0COIoasq16XypMPI+MklfEJfu9Ec3eEqf7DNRnYn4YJqDs1z52Fpww+RCNpmawD/cFrxawCSkD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YffsH8b7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486b96760easo25157855e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031375; x=1774636175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIiKn6ZLHm7vzDihA5glLwC7dBKb/e9gLHDjPrr2aok=;
        b=YffsH8b746jAPgaogEfcnYMeCYk3wGZAaS+jMa3xWi+OpWKW8xy/Q34Q521lZkDGbU
         9uSnR/iDCPbd8hgiecLx5r8jaeinlTPwaQ+Dnh+MiFvTE8Dlqvp6N3z2vpagQaHlJHDl
         kFWbXPDHhheSzi7EOKxo547rkHlR6rnSeXIJVBhG+YsS6LUJZ/4/6hW2mejBcMfuwIRw
         1pmjzD0+DsoWG7y3fteyPJ1qBCFJTbFyneY+Ck1syl9q7jAwcLeyP9Q8Us7SiBntLYX3
         beN/1Y8wLEwWBwWh1/8LvGSMRDF6ZxbjpziDPqnwUuxc9OAGwg2EhLBYM9aqBTqH96uR
         Sxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031375; x=1774636175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIiKn6ZLHm7vzDihA5glLwC7dBKb/e9gLHDjPrr2aok=;
        b=e/Fr7+PyaQujgiAvy1y/IdHxx+3hEQ2zRal3wBD7nx372SAyhMVyTIGZwnzOVMw6VQ
         Lse8n1Rz4v3EgtgQipj0KeE/2do93t+p6S8Tc4yF3gHFTaHjgClcGCatHHyklbmoiyA4
         ntNmU+eULXTUoSynPFgIbS2KvnXe3N3yfLt1/92/HMNcvG7G1A04RNqFtbeGWeeCyqpE
         5L8R5Bq5JYUYOZTtbvSPRPzOnAFb/vJ3Jfw3u+OdRWSFRDBC7stBjuwsqDjH0dHRzMgd
         kvAckOxvNfEaRvsH8htPK/vRJzYo8KhZyRJG5819YbaKW7syCHP596mTuwPlkVqaNImE
         3sUw==
X-Forwarded-Encrypted: i=1; AJvYcCVhEvFVqg+YpDs9BdpYQ28v3Wg1iaAFQPrUH6ZmK+LMX+rsA06dAVzICu5wCGi3Us54SlMnT1h+oknPmvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh485HhId6XT9t11zvRpdvuFe+gNazK9zfNCthDm+nyzp47yfw
	VT1nh9DWzGKi1kuns94mk3c+32QOhNYxI0Py3RzPQvsCigvg2lrvTn8HySivygbUR0s=
X-Gm-Gg: ATEYQzzlrlj0cAnAjEXtYabvSswGIkgsrEeP7LacLwTqdp+p7NPSkH7aNXdv39+M0Is
	8ZC5mI4cdhf3yLmuqBJR/UGKb4hblvbaXJkvECbhnxuJwyvnIYXkX1Q+nHRr0KAYsKjU/Mbf7wl
	Pf/An+FanaUgsBBcnQfziV9uq8sRBRbpezJLvdkaLSOmIk+aAnlgssc2nlQSO3KDDE8SO8YCmr1
	8pcTFLAwCzJYohUQCu1Q+0y1RcaDUfd008VoQCKOYIJcD4xYjjlJFelQVNrU74NTL9Owbi0yrqr
	liPtZe6g0968hQnWPT6/ZHfqIb9t4L+HcNDgUqVqIkPrKJYz83mxMar7jdN/6ZY4swdk2+0sCpB
	NNbJ6lESfVeFvtaSlGWZtdf7WuncjTNZYAXD+XFPpImZ20s1yKrX/d1oHLeyW6HiqFlCXB7VWFM
	6+bgobmjrv4w==
X-Received: by 2002:a05:600c:348a:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-486fedd7fe6mr55523325e9.13.1774031375336;
        Fri, 20 Mar 2026 11:29:35 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f82e6sm20771397b3.17.2026.03.20.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:18 -0300
Subject: [PATCH 3/6] selftests/run_kselftest.sh: Resolve BASE_DIR with pwd
 -P
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-3-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1081;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=RrVGneoI97HAbFh0po9veu/6l2CV4YOVmpXZ5Qd0yT8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP10u3g8MDAKX+kB6cmaiHc+8KUwIN2ttQAAFSFeV5mvkh/k0v9uc8Xwu06/L1f3zTyFuHDCv4P
 s/HAjL6I7RQ4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12100-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,run_kselftest.sh:url]
X-Rspamd-Queue-Id: 50E3E2DF85F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

run_kselftest.sh only needs to canonicalize the directory containing the
script itself. Use shell-native path resolution for that by changing into
the directory and calling pwd -P.

This avoids depending on either realpath or readlink -f while still
producing a physical absolute path for BASE_DIR.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index b782b025d002..5f7bce9a640b 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -4,12 +4,7 @@
 # Run installed kselftest tests.
 #
 
-# Fallback to readlink if realpath is not available
-if which realpath > /dev/null; then
-        BASE_DIR=$(realpath $(dirname $0))
-else
-        BASE_DIR=$(readlink -f $(dirname $0))
-fi
+BASE_DIR=$(cd "$(dirname "$0")" && pwd -P)
 
 cd "$BASE_DIR"
 TESTS="$BASE_DIR"/kselftest-list.txt

-- 
2.53.0


