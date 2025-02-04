Return-Path: <linux-kbuild+bounces-5616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BCA26B47
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 06:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2FE1885A28
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 05:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B0025A635;
	Tue,  4 Feb 2025 05:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKFSimrP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C725A624
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Feb 2025 05:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646465; cv=none; b=KnwKkVIDsDF7BuhvJyJaecRLEq88hrWGiNWMRNRp5S1Kgfkxzk1VeH7NAvH/BdkYZeVfem1mRGgTdExfxD4IdJt2UYse0OitzD63sCEoFdAa5InqhOgyjDWvDwGAdn92YdtbWA+OYBF6nDHl21l3UYJkLI4fIP0Zl9odUYzX+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646465; c=relaxed/simple;
	bh=5DZw4yfLlGCFG2Az0CqyQWnqnWGa/Vhdi7e7fSIJ85s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nqxy72avsUQhxQfZduwObt3xjZ8Cg/pmmDrFyZiMr/XM7rNAnMM17E8clFHw39f0WX1QW8YJ3s8W1M1eOOhikd2uz1L/0E4NQMOEI4zOKoKQQ/6xjDBnJrVJny6Qcz02AH9H8s12Tp6p/NcvObqi7xrwOmmXn5M3kCaby4fN6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKFSimrP; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so9419586a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2025 21:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738646462; x=1739251262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAG3zCS36pmbQ/AUcetEdklJVtmrzTW775Irpf9uy4k=;
        b=FKFSimrPK537nVgm9KndX85mNlylWjlH9g5BswnOKCtqhuMUXjZleiC1wWo/r/Q2ll
         sNTTU2mDFxQ8RuRAo923ElaeZksDmqptuEJcUt8sbTAlcGeRDdaQhTibK2NYePbvgliF
         twMvUEq1ohN4kdx8V8dVyBXE0OaXARD4Z7JWsjcWIQfV5Ju9zEpMEU3up4T3/e0+bA75
         K0xY1pkYWTmCFVx7ypP8I9oh3UQ6afngcpZ/Lcoz7M6n9gZRaxYnGU9AzIofNJxKgOOZ
         WlWWO055lfYIzfuzlD8EKuf0Ty4tcfISJYEiHxPJXPmAfA+LaW5Lb2/DlMkHlFDwzq0g
         LQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738646462; x=1739251262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAG3zCS36pmbQ/AUcetEdklJVtmrzTW775Irpf9uy4k=;
        b=FMDGxBKEEvctZGSm23RyNGkW1il0lMnGEo22U5bEeQu9TI9pKUzfDL9UJ5w8OP0rht
         L8klRX8KjQCQLTMnFCi+Woz7VwFsDtE2XZQzOCWOLkLINmGziSwYw2Z0/O1RmWQ0hOYi
         /j9YAmblM27E/MWk2F6UiFffTB3QDHnlHirW+ViKTPfOwsOALD29Y03DpomUrwaJaK0t
         GDmjXhEzhu9WnMDQ2j9mxWCDLxaMchmJWpTAog5OVLI9kkQ7W1KXBT1ZcmYvhb0mL/0L
         biEQV4/kGLh49z08VVrEJ/aW3Sq3oPODVS0rrvEn/+HHnb5k/m1c8Vo4cKNHc/LC52N2
         AO8A==
X-Gm-Message-State: AOJu0Yzq4SSG992e/3v9MavEREWBzuKRZbykz/9vmtTzOiR2fzTlTl9y
	ex3d+Nva6EJalxI+DSTlB/tLrkuMl5wDcP5/WByA2SGU0MWKyosY5vAnOA==
X-Gm-Gg: ASbGncuRbRw7GpZ9wNFIRd7Vd1b7wBAVky7dZ6IKHsnGHXlJX/ftQI0fO0yCEEAEXDd
	EasYEVHgh9oLhak18DUgKQgcr6ktZEkyMlfndvtRxyZu0g8nf4QGosqovQ7JYK9En+fZB+T4QN4
	P/m6dEOwEd2s4pAsacTUiHq1e1a6Jl8LME1YQR+0yyzG2+dx2o78qUiJ7g6y71Rdlezxv5Ztu5/
	+NGephcOITsaKH9ILWXe/n5vsTt7Xt3AMKS6Keijo7xcgb3ZY/aveN5+sKmrWeaipHoCAiWtgEE
	7nQdT+R5pGzoiJle34igKcMsm2fEI0aHp5UZC5LfPT+zUP5m4AuViOK1gqYzsZcLz5LdBCbuFfZ
	v
X-Google-Smtp-Source: AGHT+IGKCu5ryikKO0zv7OO4q+iHfGMQp+tzkPBuyNGeXS3McfxnVISpgBz4DJH7IhXvvBXWdmkO1A==
X-Received: by 2002:a17:907:6ea3:b0:ab6:f4e0:c06 with SMTP id a640c23a62f3a-ab6f4e00fe4mr1996557366b.21.1738646461323;
        Mon, 03 Feb 2025 21:21:01 -0800 (PST)
Received: from ozadorozhnyi-MS-7918.lan (176.111.178.190.kyiv.nat.volia.net. [176.111.178.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47cf883sm851545466b.49.2025.02.03.21.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:21:00 -0800 (PST)
From: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
Subject: [PATCH 1/1] kbuild: fix misspelling in scripts/Makefile.lib
Date: Tue,  4 Feb 2025 07:17:30 +0200
Message-ID: <20250204052004.5583-2-lesorubshayan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204052004.5583-1-lesorubshayan@gmail.com>
References: <35574>
 <20250204052004.5583-1-lesorubshayan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleh Zadorozhnyi <lesorubshayan@gmail.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ad55ef201aac..cad20f0e66ee 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -305,7 +305,7 @@ endef
 # These are shared by some Makefile.* files.
 
 ifdef CONFIG_LTO_CLANG
-# Run $(LD) here to covert LLVM IR to ELF in the following cases:
+# Run $(LD) here to convert LLVM IR to ELF in the following cases:
 #  - when this object needs objtool processing, as objtool cannot process LLVM IR
 #  - when this is a single-object module, as modpost cannot process LLVM IR
 cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
-- 
2.43.0


