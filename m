Return-Path: <linux-kbuild+bounces-8929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12188B9383F
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 00:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25E62E1786
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Sep 2025 22:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FAE31A072;
	Mon, 22 Sep 2025 22:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WPn7RD5Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6333176F2
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Sep 2025 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758581349; cv=none; b=sjNrmKosjn78/jmDPzwM88jaAEY+gPG4IkUa1TcQiP9XlCa6VAjcfXMcaS5Cig295g77234ULyr1PJXxEAu/XhiwZFx/VLrz3eb1YQFr4XnFqoyuUyN9kKdgRekGPjB3gRmJph90JuJh31MRFab93xhkZTCS2ZZKElbYvZX9dSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758581349; c=relaxed/simple;
	bh=ILLo7rGl9b9zjnbqd3MGYox6UQqDjx+Lj+bAucxUn3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prqn9JH6x5xv6h8eoQsWT2yoWPz2gTexyIsYKt6O7J6DKyAIyp1s0Xvn+s5P5hoMAfNRUaNHpVMm8Ehz/U4vhNQnuVLXhT0LxDvMAUtl84XWODxGy5/kZpPd5rKmgPTLhnLkgJR7PW02iX9WZ2ecTepfIcnfIn0ItL54RAndFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WPn7RD5Q; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-74a61973bedso4052047a34.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Sep 2025 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581346; x=1759186146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1e3rwdHznymhqcKmmEPEdrOZ6tPA6MN5wQk3iVJNOM=;
        b=WPn7RD5Qi6XSMcYEJ/8JyYVmhbIVoweqcxjNoEoZz6gNAx3KE++DDe5dEPHnPpQgRE
         QGR6UGMB/PQUiBNWDg6gvt3aIxDDbN4GEdaNQcwjqsW0X2scOuyA8FglF+3/luYZy3kP
         d3CZb0KFs62EHjTTEZSWl+2svSrNyI+ovIxJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581346; x=1759186146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1e3rwdHznymhqcKmmEPEdrOZ6tPA6MN5wQk3iVJNOM=;
        b=AdvaDPism/4/ZXVYl5fp/uSioM5s/E58Jn0RALh1wg5dmNYn0pdy5x0lzlqqqi6SBY
         f4kRNJTkljVzuRYcz0sHS+00B+p3EiZxTBEwNs5Ispy0Hl1hEzuDgPo3iLmMs2mDsEyS
         zx2AbgFv87EGD6DYeT4TcclnZ+Wf7YxWgF9jsmyyTorNtazlaIAxzAPYw+6pxUjrOlRs
         5XDG7J+7gGzg8oUH8zbePGnq14BCXOTTIJPNjmv8iaQ7LicO1PaMbjZI5LsZpTEt2XiM
         kDhMiQga7Km/K7cqqLn8sMq3jgvskIKwzpiMWXlVrS2zLtOo/pYa1SB2Uj+jZxMfqARt
         J/gg==
X-Forwarded-Encrypted: i=1; AJvYcCU533LcJ3WqinLk/ouOH+t0kmpU8xKXLnzv4i3AVAdOp1Obu9Kmd/DffNO5V/1Qs35xkeYxrR1RrR99Qf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLX3jFre6HnZULg+WqxE8XR0pw+NFRHCBHDycFH3TOAUZN+jAr
	UpaAC/pLR8WQ5NMotVTJK+kAKqdzuvgEIv+D0DX3ZKiTQ5Uk7yhZwTN2LJNqhCHNAw==
X-Gm-Gg: ASbGnctqiNY5FAvauaxlKnRDyPLH44pdEEeWt6meMSdEEEAOt9mfeT45bhNb9tDLndf
	6DSI6CVO3IpvRJt3Gcmso9sh+scklSBfDrTNofGD1jaQyBUeTKWX+Q+PGY0GVlKTTPEiGHkccOv
	KMpfPpSGjj0IY4tp8CjQ5JzGu6DeLZSOCsCDax5Q8qG3AmU0qvB22vTS0BF3gcwimCreNUE9KDw
	Kt1Lq7kQCmuJF8JcsocZXOVAqxHmioxwwNZZeV9Z8kotXhedmrjcxRD1bsyyxMRXfnTSDCfQH6i
	xdaYNkbdvZlnlyLt6KdHKxDxUlFLzdDeImYhcZTehBMvHZd2muJ2JWqpw8/VwUbBT+nTWepPUaK
	QTg33CH2sTSGuFc2Lz60=
X-Google-Smtp-Source: AGHT+IGr6tap0sPqebFz42P7hl+4lEILp28PDgb1nPW+SCIac0Vdb7urReiwBVQ18LGCt5FqC+bUvw==
X-Received: by 2002:a05:6830:3484:b0:748:317:dd81 with SMTP id 46e09a7af769-7915d3cebf7mr212842a34.29.1758581345941;
        Mon, 22 Sep 2025 15:49:05 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:49:03 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Han Shen <shenhan@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
Date: Mon, 22 Sep 2025 16:48:32 -0600
Message-ID: <20250922224835.1918759-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922224835.1918759-1-sjg@chromium.org>
References: <20250922224835.1918759-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support 'make image.fit FIT_MODULES=1' to put all the modules into a
ramdisk image within the FIT.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

(no changes since v1)

 scripts/Makefile.lib | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..2e880d9b4706 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to 1 to include an initrd with all the kernel modules
+FIT_MODULES ?= 0
+ifeq ($(FIT_MODULES),1)
+EXTRA := -B $(objtree) -m
+endif
+
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(EXTRA) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

