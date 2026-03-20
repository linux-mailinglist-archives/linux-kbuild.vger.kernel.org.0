Return-Path: <linux-kbuild+bounces-12097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNaTBhGSvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12097-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:29:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8C2DF6D5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A27C3008242
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676383E3153;
	Fri, 20 Mar 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IZgFClXw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDA3E7149
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031369; cv=none; b=ZliLlSLtfxEdwkMb7tJ2nXaOCvT2J/AqKMoj+rZR6JWl8eQL1hOLKlku98vK4TmYD7mYyLzj6aq2457k/6tBEwgHAR2e9qowuhNu0By26bVZ/McK+wiFgfCRTD7eh9gdMeyc63tgkG53E4R5HxUujn++hwpaXnGfS+k1pm4kaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031369; c=relaxed/simple;
	bh=ZK2PP6H5Htd3EMxs/tbHhD+tM4DKDuhATR/fPLzNQiQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ty2jmdNsWsuH2lrFWwCWzW2d4XZDbENy/hhUOHsq5o3uoZo6dPumOJYGTvu/8IzTtgHlMA7UhBeGzPZIMSs3oV2mJyj32CddvL0K8sgcdtBX9bpyfIM2hPXflhtzgX4zj23PZztMfs35OHjSxKLsOapwfAz/lCI37NNaho73B64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IZgFClXw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe655187so13504465e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031366; x=1774636166; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zI2ieTUFXonsrBR68Y1B781kbM8PTDVs2B5gc4uGYm4=;
        b=IZgFClXwGgS+tMGGJ5bFW+tdktw9xzed/D+vCT+COQ4jx5uQRHQtT+jHQ2PJROZw+z
         TxP0sjD/n+MeyEApNHy9BX+SwJkrd4P1YDT6T6mG4fw5oM31qveGAYUBxwNqIZXa/LE2
         JvdqAPCDkuH66rJm0LXy2qyZd74PmH7vg+lhj8nf8Bfd1ME/wQcYIGR5Ym8YHs9MnUZ4
         8OUDkJh3RnIeOyQP8AW0zN94sXaHJd2qJks3wAeEdakZLThsHGlIOF7XoorIyDCmnNaO
         FUFQuEDJtcbYTiwVDQhe0h2agHivlG1qfK8lis3Unjpr5QbAuU81+BRXjrS1cxZBKdkP
         pGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031366; x=1774636166;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI2ieTUFXonsrBR68Y1B781kbM8PTDVs2B5gc4uGYm4=;
        b=Ee1TzRX6i2Xp9cf5lV6QLTZX9L4VjC7C/rsD2z5tsECuQ6cb5BuG7o5jGgeJ2+pBdF
         8HShN9SQ1GjCoZiu8iO4OJTDKJ7zMcyBc2duqOvnklBYJCQ7hW3JuHpCrNHmhaENd+eN
         +GskjfjN83Ho3EbW1YJy9w4aEW9T6JWNcsnR4Otww2Z1PGh6bVa8ElgfC0T8W/5iGzyE
         dI+HCkHconBmUCeiO1sXbYxZZEfTLQ0sPEQO/2KlhIuVHEuSHMUTk//NRWKzG6WBdfHj
         /EaSwIRU+hT9mthSXIFn6jCUm5OCd4E3Lk2M6IkLmzhegcz/SwfBHEoYzbxBuaBbQU82
         JJhw==
X-Forwarded-Encrypted: i=1; AJvYcCUJCZFUnsldLB1b30RNJKo9RUyifwJW0J7GD/JKrxGeTSMKKN14pQHlXNAyKt3yAbvbZrENBnZJr4teGyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGI37wMdCu9Bm/QobqsCdgoPuHavXU9gEDkWy1OeDXvTt9L9u
	ZYFuG4JfDiFkpcPDQD5oNJk7EswZiR89aKYs4pgLSQ4FTyOKP/Eipe5ZA2VhpdujKos=
X-Gm-Gg: ATEYQzxdAn7WJpyWz0FRf9FknFzmR4+XSS8RWkDYvJevZ2ekSgKGZWULGoqqe8DJujR
	rDKW/SsGmO0l+N94Ygpy26PMeUsPn2nRJnoDaqCwcRO+n8sFnN4IjDWEcTs+6UGBN0Q1OhgJzLK
	lHbDhbuVv5w49gbLjZwuqml0klRhJMUmbPiCGYlrPCpJreiPwPL/KmV2dx0rJKeqEmPlKu8wU2N
	t0aL/f5UKPDT6liD6N12JMimMjfUjjK6Sn3Z9AP5EMJPlaLf3Qld7KzpBYFkM9xkgp9RvmkpDEk
	jw9V1HlyXRg5YYkGs75iqMffglJqd0IZ3TMBZAH2NAt0wIf396DP0b9mtAAsZcmfDTumSUIx69V
	ltfo7IK0x1xFHu3yY2/AfLffRQoWP0Le9IoU5MjyyF4jlX4RtD0AH9Yr1hMZ491dvSiZ5ltYOY0
	B+0ANlHVGn5Q==
X-Received: by 2002:a05:600c:35c1:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-486fedb2545mr69529735e9.11.1774031366421;
        Fri, 20 Mar 2026 11:29:26 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90553b04sm19518657b3.28.2026.03.20.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
Date: Fri, 20 Mar 2026 15:29:15 -0300
Message-Id: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPuRvWkC/x3M0QrCMAyF4VcZuTbYdSjoq4gX6ZpuAe0kKUMYe
 3czLz8O/9nAWIUN7t0GyquYLNXRnzoYZ6oTo2Q3xBCvYYgBjV+lsTXDIl82zJRj6nO5hHwDrz7
 K/8Gjx9OdyBiTUh3n42dRmaSe32SNFfb9B4t4OzmBAAAA
X-Change-ID: 20260320-selftests-fixes-dad2b1df50d9
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031362; l=1348;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ZK2PP6H5Htd3EMxs/tbHhD+tM4DKDuhATR/fPLzNQiQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDusXjprKnLKlyP7MGf/ErCP+mTOT5X0BuS1RBlRTJ9qnSW1rl08GzXeciqDYnRapZnufVA2lyA
 3geAkd9hTwwA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12097-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDB8C2DF6D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuah,

Please consider merging the following patches. They are mostly small fixes
to run_kselftest.sh, plus one feature: adding the option of passing a
directory to the "-p --per-test-log" argument.

There is a small corner case spotted in tools/testing/selftests/Makefile
regarding failing sub-targets, and also the removal of the default install
directory for out of tree builds in the top-level Makefile.

Thank you!

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
Ricardo B. Marlière (6):
      selftests/run_kselftest.sh: Remove unused $ROOT
      selftests/run_kselftest.sh: Add missing quotes
      selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
      selftests/run_kselftest.sh: Allow choosing per-test log directory
      selftests: Preserve subtarget failures in all/install
      kbuild: remove kselftest output in mrproper

 Makefile                                    |  1 +
 tools/testing/selftests/Makefile            |  8 ++---
 tools/testing/selftests/kselftest/runner.sh |  3 +-
 tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++--------
 4 files changed, 40 insertions(+), 18 deletions(-)
---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260320-selftests-fixes-dad2b1df50d9

Best regards,
-- 
Ricardo B. Marlière <rbm@suse.com>


