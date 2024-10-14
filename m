Return-Path: <linux-kbuild+bounces-4083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D199CC7A
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2003E1C22AB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F821AB535;
	Mon, 14 Oct 2024 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfnDdsLV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369E71AAE09;
	Mon, 14 Oct 2024 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915242; cv=none; b=AEX1T/MBfmhX7ea83KY98VIXYpDAyfEvway8nqZZoTlA8HBkXIHo+aeZ2XdbxzVkZqc/PD+LN033vvo0H5wf5GS1jmx5xAamk0KY+bhdJLQ56jMga+KNrzJZ2iK6t+s0QxAP/W4+dDjMJeGh4yrHGhHjiiGL5lzMK1k2IsPbBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915242; c=relaxed/simple;
	bh=U9CBDFdubCjeP4chXsqTbx6AelMOMWpOu8+4dkQNBKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7gDR4NLQmUT4t/eks+hEmf4HJZ7SIxir9A1hctTk4WLE/O9PnPxRnA6rTmQRNRmuHSU1MIXB8FqfxuzMH1I7eDJdxp63RKt5Gq9cXEA/z83c2odnzzURcgh/br4UZ0Oxfu1xGvON8Qm+Eq9BCjoLV9OQrMg4pEDRsr8dc1/iWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfnDdsLV; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e290200a560so3719696276.1;
        Mon, 14 Oct 2024 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915240; x=1729520040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM1QK7QxtM8b4HCQgjUKLYH0v5Y2AcqxtZU/di2qGfc=;
        b=VfnDdsLVXyVpJxXGtEjydSGkb+85sk0PjdR9BsTZpy6xh+zFwsSQhHMJcFzMgpFC07
         cijNTwOWyICq9I5grTKWRfrjoZ8/b1q3NjUqBO4EvV4a5N6fl7ZtXjuu6HKzS27Zg8kT
         tZHEoQOUkgpqA2Om1LW2LRF8LtpqkfZMj2kMJIc1YJmd00H/zW+aFeKKC2Lc8l1p0k2M
         +2CW2Scvvk/5Rk4M/Hqlsk4TcN9HJCgad+1EtWoJg0hzUfOlVNrb87YH6Ptj+4dUHjMC
         ki+UGHHL2msPKn/7sUh6E/OWPUkw3pKMgRGn3ODvWoeM0MMmauTJ6X5jXUChPiPRhHCQ
         hm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915240; x=1729520040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eM1QK7QxtM8b4HCQgjUKLYH0v5Y2AcqxtZU/di2qGfc=;
        b=YyGxVULMUcEBnEq8FFWCbfoLAj4rajacKwhTTZAsB6mtr72IXBPV0wJq42LsHrvMBF
         nK//PKtI0MyNxjg6lOT4M4fkAJ2Yr6C2ftkbs9K4sq1ZAq5XjLC5DTcZ6deCcqfTXGFr
         3LfNORUbLJXypL6RYqjEbKMGhtihhRse3wHiC9z5MKKaV38/bqdp9DAMOQOT2iwKWkHC
         /kMsRSg7hyLJQNTJXxLwRHN84WyYKiHGgBVvCrpfCTl6A0kbwTFeMMBjdkRdVyrv4HKb
         gwq3y2uNlYqjduk+XSE9i2xkmppuSytb6vMSU3HnBHfNmqtYWvxQpzR2vjpJTLrn1JDG
         8/qw==
X-Forwarded-Encrypted: i=1; AJvYcCW4SMdEZBtXEI3hTIEc5+757FBGfBwiL3VhC7n+bkzW0QKIF+0qX2f878HEdMoIjiUBDjVaYwK/RoQpTLw=@vger.kernel.org, AJvYcCWO3Gk/yeC++5WC6l5HJwOvOHpz0aG63zo1r0ztofFSVTNZOaI1CqxClHPNkdpHypEkJ1ygQC695nJKUB8z@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhtuXK3xrE9tflCUm3MbzHS6qlA1HSTB4RQNzngc/PjQod27Y
	sBtyffloGfcqE5gQjydfL4brXFgDSS2DAlTmUHsDZ+hhOLAjj863
X-Google-Smtp-Source: AGHT+IESuJBpD8xDBGGQM4qOMYv8Pv6xy81i0m0rCP+RlWz7iuTdAeYMjKIqOgdbGJknMhoo9wFD3A==
X-Received: by 2002:a05:6902:218f:b0:e28:6b10:51b4 with SMTP id 3f1490d57ef6-e2931bd708cmr4822361276.46.1728915240177;
        Mon, 14 Oct 2024 07:14:00 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef7a00bsm2440552276.53.2024.10.14.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:13:59 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are tracked
Date: Mon, 14 Oct 2024 10:13:32 -0400
Message-ID: <20241014141345.5680-3-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014141345.5680-1-david.hunter.linux@gmail.com>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track default options on the second line. On the second line of some
config entries, default and depndency options sometimes appear. In those
instances, the state will be "NEW" and not "DEP".

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V1 https://lore.kernel.org/all/20240913171205.22126-4-david.hunter.linux@gmail.com/

V2
	- changed the subject
	- changed the condition to be more in line with the script style 
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index a85d6a3108a1..85f4712e2bf3 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -220,7 +220,7 @@ sub read_kconfig {
 	    $depends{$config} = $1;
 	} elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
 	    $depends{$config} .= " " . $1;
-	} elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
+	} elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
 	    my $dep = $3;
 	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
 		$dep =~ s/.*\sif\s+//;
-- 
2.43.0


