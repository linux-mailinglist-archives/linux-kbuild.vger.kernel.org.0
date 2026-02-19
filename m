Return-Path: <linux-kbuild+bounces-11341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDwHMgd8l2nmzAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11341-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Feb 2026 22:09:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC691629E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Feb 2026 22:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEB2230B1025
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Feb 2026 21:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD3325496;
	Thu, 19 Feb 2026 21:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7sr/7xO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0F327204
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Feb 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535084; cv=none; b=B5gNB1iziB2arKhn+uVZXkLwywwPeEUd0r2+NJ3FbbYs+QMfqt0qNjxZFKDUloMNl20eUOu+d14+aM02T9b1/3oWMTJoroe3++cDYtP6EFxxSuVJb0sneO7rMa/bvvniATEW3lZRyqq7/uc2AWxPu4uEmb5Nv62YjPHA2YY/1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535084; c=relaxed/simple;
	bh=FRv7eowAcNyO65MPdC6mYQ+EkktIEpwQbRI5qwDk7Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4/cdfpTDVvWxkTfVx5KyXaYMzAeNRLbv9996NbbrWhMZq2UDCgwjG1sRlhQYZ0Y7OYbvyjS/RlGnORzzloES+p8Q0quUOWhGgqGtoTdbvBvX6CXM+R7BMYj/EqHe23ueu8fkhpW6AZiTl76AKlYdPUZSvAOBrmlc6WIQTkycjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7sr/7xO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4362507f0feso891542f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Feb 2026 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771535081; x=1772139881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0GUcmDt7bO2Sn9J+9uf0HNcJyXZ2g0c2Cg3p3pl5n4=;
        b=d7sr/7xOKDrfhuaSB0ZaM8z+I9/E3H2P1grkmIKoq0mrR2YMOLI7Ei5lN3G+1tuL1M
         bAh1L+IT/x/2I2nzZvOksXY/2pW3tkPfoGlHSM47Mfk6bEEliZO3+cixLQyWldh8KJWA
         7D6mPT/cJoeEcqs2TFWDXW1cuBZOu0Lq7s4CD6i4ewyM1iOnXl/kdRZqGfcqiNZkPjZu
         bH6lcohp9EM2RMUZViYeI6u5y62YyI4ET6XnnedizeSr6N58QC+Z9JjAWyHBNq6vYbSH
         YGs0TFuSpiT0SF6tgNVHZQJSWiHrPR1NsyqkYLPEjJ4vnJvjHwn3zTmQU6KUpwrl8KcV
         WJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771535081; x=1772139881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0GUcmDt7bO2Sn9J+9uf0HNcJyXZ2g0c2Cg3p3pl5n4=;
        b=k56iYgMyv5oV6/UsAvvatNOK/VzhevIdOzfMvw55e8VlKY74vnlo3L7eBNrSCcKUB2
         Ml9ycHTMrEFvd8EbprtHGsXXnLV2eZZih5ZSCwYgK0OsuCC0hrVBwd5ypmebTHoztmmh
         kZh+XSE+keBwkLzL9FJCCXpPe4XV6WMf7BAK3Y8bpJWvCf6qZPdWX9jW/y+6DzOkrTfp
         XCuXJ/ZO/fn1/aIOING+zARweRzh2YH+c5jUekzHNtAeln0llUgFwwSroJz0AojhuX7Q
         DzUcvDjSiorjehFTMDaa78MXJz7z7WQEw1rzPs39ZOaUCtQwra5S193zApAS9MOiLTZs
         kNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtEcYef/bkyqkQtpCefbo2D964aiWJldRyTJrPZ7ZqKG8/Yg5xn6LIVq/pD0pbPt964zxrikYKsfNp4mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSdQUYYiM8LL8M8cUDbJbph+k2jX8TYbkDbITjrjSiclXJF0z
	tBWeOz/txh4kzL8WlkUR3HaRmyB5fSHuyNCJwQpTMm2OJWYNePCiGQDi
X-Gm-Gg: AZuq6aLl8eAN6YF8DS62EX1OA4FFpza3uMTawmtHTC3w/Et8uv74iKCmvHLcGMONX1Y
	fY4ZdeU2T1z6fh8wY3QIb3CI9x26udYupo2TsnWJ+BhhQWh3OBm1h4TDrhp9olN84ScenGx8xx7
	ilg8Jl/Z05rTFvsN4WbTjywX2LBoIRS8VPTTBs+65DW9NIqTIYQ2zsN3Y2d6HyELfPihgJABU7g
	F3WTDAOSEfdM2tkW09dS/uUzoxGc6xOiH6MLe6ToLjM4poUMybWE75ia9ldBXyebB19LGpotBQv
	6octJZRoXtURo90d7jLdNAwL+zbiZdpjYLhdDWO9vCQiqFe/npNJLh60YN5R8qZdTgGFglExwH6
	f0zB5oXBrAj0UJ1b6GrfLTXEzAZCUmFtWnBe65XOZ94IaEYq58wGeUOOLIsNvxQX615sQAwLLZz
	rQpqSJamXtGQ5HImfOQvD/mZY1rULf2g==
X-Received: by 2002:a05:6000:420a:b0:437:6758:ce75 with SMTP id ffacd0b85a97d-43796ac216amr43835401f8f.23.1771535081365;
        Thu, 19 Feb 2026 13:04:41 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a5b4cdsm55044994f8f.8.2026.02.19.13.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:04:41 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	initramfs@vger.kernel.org,
	Rob Landley <rob@landley.net>,
	David Disseldorp <ddiss@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	patches@lists.linux.dev
Subject: [PATCH 2/2] init: ensure that /dev/null is (nearly) always available in initramfs
Date: Thu, 19 Feb 2026 21:03:12 +0000
Message-ID: <20260219210312.3468980-3-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219210312.3468980-1-safinaskar@gmail.com>
References: <20260219210312.3468980-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11341-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,landley.net:url]
X-Rspamd-Queue-Id: 1BC691629E4
X-Rspamd-Action: no action

Binaries linked with bionic libc require /dev/null to be present,
otherwise they will crash before entering "main", as explained
in https://landley.net/toybox/faq.html#cross3 .

So we should put /dev/null to initramfs, but this is impossible
if we create initramfs using "cpio" and we are running as normal
user.

This problem can be solved by using gen_init_cpio.

But let's make sure instead that /dev/null is always available as
a quality-of-implementation feature. This will reduce number
of failure modes and will make it easier for developers to
get early boot right. (Early boot issues are very hard to debug.)

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index f911280a348e..3e71049b3dcf 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -525,5 +525,8 @@ void __init create_basic_rootfs(void)
 	WARN_ON_ONCE(init_mkdir("/dev", 0755) != 0);
 	WARN_ON_ONCE(init_mknod("/dev/console", S_IFCHR | 0600,
 			new_encode_dev(MKDEV(5, 1))) != 0);
+	WARN_ON_ONCE(init_mknod("/dev/null", S_IFCHR,
+			new_encode_dev(MKDEV(1, 3))) != 0);
+	WARN_ON_ONCE(init_chmod("/dev/null", 0666) != 0);
 	WARN_ON_ONCE(init_mkdir("/root", 0700) != 0);
 }
-- 
2.47.3


