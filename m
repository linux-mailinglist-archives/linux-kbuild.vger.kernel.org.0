Return-Path: <linux-kbuild+bounces-3540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4DB97867A
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92FA61F25EE7
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64583CD4;
	Fri, 13 Sep 2024 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0wcaXpr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FC126BEA;
	Fri, 13 Sep 2024 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247567; cv=none; b=ORv7MwwH3u38L3n2ddCwCZ+z4Jfb22qRS/VBBLqh5VnfrJdj6vg7bhHjo6VWVK6EQ7JPxFDQ7ppt9WMiIFn1ZjZ5ZoEu4D+nfUPCrKEs39NcYhp35eDP3YILK3+QM6U9fBKrJZ4kME927x6NB3uFkkuWnZ3V/BX+p+Af4Wo+sI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247567; c=relaxed/simple;
	bh=SIkPlVRol/taIjaTDlehF8X8yskEweJFW8WetvyI4Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQJRz/KrLB4REdQps1LpzX+mphBLmwr5zlvyuKEUy5qH0giiMHIUFt6ioJXK+vXdnUIfu/Tmwba4j/XIvQQ2lV6pqnzXEWOeCL9SUDgETMB7+zsRn5UzUd9Kqa/JocK8lOkwPLcJVyw2pTPkdKGbtTA6XLu3Cy2ZqKDtIb859Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0wcaXpr; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso1203359276.1;
        Fri, 13 Sep 2024 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247564; x=1726852364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsEn+TQ9mze2i6QSH/8M8y8UocCy5ZXHseZjovcKxlk=;
        b=E0wcaXprZKiyqYkIP9WWfiSHo59qRSqP4R54G4z/VglriNPJ9glB3Dqx4VGsCYVNTw
         kou5F+dt3K/FeikrOQOhZBdzyGlPEKnEJmzfv3nvSaLonS92Nr1gq76XyEY73HJ9Iu/K
         8khAJNBxjgH/zihEk4iyXDY7ASUbCaTYyUMC0sfJcuzA0YrDVukycU3ojtXhxpD3YRXq
         QkLWGILkd9pJFRaHleug8DoIn1jFy9jk3VZT38OLmbBcBJ/ka03TG8WTBIUWenHe88wz
         Cp2DGpcbW8u5uxSFZcEwJxU7BnM5Ji3Wnu3JE3C2vNnf/LV7ZxmZya/2pQeFwRQ8n4Op
         e9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247564; x=1726852364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsEn+TQ9mze2i6QSH/8M8y8UocCy5ZXHseZjovcKxlk=;
        b=Ah33sYJS/2Dzd84mGUdDvp0xYZAlleh4kvEBKU30jswSZ0uwSssllehVSuMecVu+rz
         PQhbIB+ZU4QewrGlCZw2Jn2oGV/vixeEtAa8eWuk4wTLMjieyCpPS6lMFWJybLIprb6d
         G3PLSYa9sNIoKMejWHLnSwaNYIr9F3LJisos9dA5QRTo+vBQsGmR4v+ktpYx0iiilF5t
         kl/bggFQbmdxMTzCrntu2A7fXv6dtqFWcs3VxMcfI2osIjTnXNMebWOcvtK4j64IkCRQ
         fOkVbaN4K8xeV++n1enp8LBEO0tjWG3gwQlEg9qD4KR/XRsrgkvHn4ow3oiABKS+ZeDk
         mzaw==
X-Forwarded-Encrypted: i=1; AJvYcCUHBEk91nwCCZQ+chOO8qgzxII/YvaG+nEe2WEiJjL0To6Eb2uJlnBVf2RFzgJZEMTdEuy8/CwAvSl2wGmT@vger.kernel.org, AJvYcCVTAm7kU68TMr2EW+JLqPyYboVLzHW1jMZPxyiuxd4dwFqsvlKHKzgEf9iMoRw91FRO6NqsOgYY+MBgTDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZLDu+L42YY8xkk1pMKu/c9qUYI9O2LwpljPxtLgj2RDtACPOl
	RRF+eaQQyTNCso+iCGmoDz6MBaPSylIHrvV9gtVf8ZQebhCXfFOq
X-Google-Smtp-Source: AGHT+IEoAH1jNdEWRtjFtt9UCltLTlhXRbTfknwy3jFaoc7rs2r0MVreOK+xU5LT1JDKmFspSiJy3A==
X-Received: by 2002:a05:6902:cc4:b0:e13:ca39:f80d with SMTP id 3f1490d57ef6-e1db00e4d6dmr2356368276.38.1726247564240;
        Fri, 13 Sep 2024 10:12:44 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7bb96c3asm1457757276.45.2024.09.13.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:43 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 4/7] linux-kbuild: fix: ensure selected configs were turned on in original
Date: Fri, 13 Sep 2024 13:11:59 -0400
Message-ID: <20240913171205.22126-5-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913171205.22126-1-david.hunter.linux@gmail.com>
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that only modules that were turned on in the original config are
turned on in the new config file. When ensuring that the config
dependencies are met, turning on the config options in the new config
leads to warnings and errors later in this script, especially for badly
constructed original config files.

One example could be a config option that is depended on by a module
needed in the new config but is not turned on in the original config
file. If this config needs to be selected, warnings will show up in the
standard output.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index bb1f19a1ab5e..26e544744579 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -459,7 +459,9 @@ sub parse_config_depends
 		next;
 	    }
 
-	    if (!defined($configs{$conf})) {
+	    # This script does not turn on any modules, so make sure the config
+	    # options are on in the original.
+	    if (!defined($configs{$conf}) && defined($orig_configs{$conf})) {
 		# We must make sure that this config has its
 		# dependencies met.
 		$repeat = 1; # do again
-- 
2.43.0


