Return-Path: <linux-kbuild+bounces-10427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 001EECF9600
	for <lists+linux-kbuild@lfdr.de>; Tue, 06 Jan 2026 17:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AB383026BEA
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jan 2026 16:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6973337105;
	Tue,  6 Jan 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NFeXsLRZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D2332ECD
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Jan 2026 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716897; cv=none; b=hLnOgr+91bG2/czovcMliZh0eqQn/qonBCt3yEmymPr/uCPixnoj0ofyFB2GpXL+7f2FoxkZXsd7tTkkOaBuW+k13pkjdd7jLkK162WrS3kSkx8pwOfhJLPXAdGoPI1XSpBYP+gvjhWT4AhhQ7YmSFzzIHbHDPQPGM/ER6ArBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716897; c=relaxed/simple;
	bh=LrHmYMQz2JETizEwTZEg0NFEQD6BSQgY8pOFDuVF2fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gA/Rr9Nl3kcbpLY6z7RHF2/Y0Nq3cTe+jN0CP2PKmtW4Z8RAkhyYwaRihRZyZnXH2Qsw5RLBGFsk/JRmDIPHFZWKIwHX6beok1MoaeX8NgJJuO+8WT/Gag3NXn8GI1XQmJcPR8Qy33UvDJKd7BNi2ltOTglBL3clSyApT4LhxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NFeXsLRZ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c6cc366884so701543a34.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jan 2026 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716895; x=1768321695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipCBgG4tAC4eMeyn2MxISmiQcln27ZuBPIR3j6YmQYw=;
        b=NFeXsLRZLUEsjKzxlyzu9ZxkQr0/PzpowcX98NDDB3FaUPnxjQB/P5uoMetUcgfZIh
         bHpC8WCoc4E5qC69y4N8f5/USzPxZPMzqExpKmqaeLIR7k8+14rmJcfAiiG98Dt53R+4
         1MZBPxYf+dqX4XRH1aDPhlBvuJQ62ekOUALJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716895; x=1768321695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipCBgG4tAC4eMeyn2MxISmiQcln27ZuBPIR3j6YmQYw=;
        b=aiG49SyOfVhSHIYDCmVS93/vECgN8DHmay+HWEoVrVQw5gKa9/9sqkjZkdUPkx8RAh
         rmp7MJ3F94DuSV/TPZ14V11Dp98NNTHCLzzjetEbT2YAOOC5g3ELxOWuNYUbzML2kV/9
         4J61ccMcfZItw4e+PVGTu/EVdlDKbDgiBs73V3aYMRPYFVplS9A+lUl+w8GbbZHu2aBd
         JAZWeVV0dFXma03WyiZgH+SRMahbw/OpmQY25ZTw/Uoh3C4yUGgdXzdcFebq2wGmcI8y
         fAF95fnviaRDnU/8IZAgHtGvphOFX8iqVE/L14x7+dSk3aA60K4omO3VVCrlIcFofh6N
         FMhg==
X-Forwarded-Encrypted: i=1; AJvYcCX28gaAHP0bUu7shrkKPUa2nz4J+w/q5OkAuTE3FcT12w6+IxK/ZRhAB88xSiTg9zCwSkOxztUtY3Z411g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2p/pUyRdfPFGGs8eOhHmfOkr2RKsxQnLC1jsSApRofH4aiQwR
	gj3tDicLAW6T0adpGxmCHPPkbL8Ek0q+VL4WjlhnUOyjTG4UOentDAW9alvsjjvB+w==
X-Gm-Gg: AY/fxX54csW8Zk6WaaQ0wccn5efgYkGu+Jj3XD8evntzS8DV/uACZiLZWpKBhh2bvdh
	p3sEiCufLRGBTYKSoIhdtAFhHDdbhrt5DSdHZ/RrTX8s0OM52uXEXghaWp2ZMPjvYhKERyZ4/dK
	r572nnAUlzaKp+khQHHZalumZ5S3HwicwIp0z4wLwdpLe9cdxJ3XCJ/5VvXR5hE2uqxy07JuqK+
	a8IGGpZYK07Sn0E4CQVWNQCtLjYK33mpqG8wKXXohhxniK3F8xrqp/FdI3SQTvn4fedUdZyp01i
	qYFgd2L4qvtF5ep3mv2NWfZHISY8h9fulewAPQXfocHOXi4qwhjdDkv4/YGC/0U7z56DGiCR7CH
	sPWDbnyccSs+q6chDCQ94W6g7o8rehb0IegfO8nrJkCs8WZfkzG7uPFUg/D+S1P3r2WB9zIGwIp
	iZmptj7rQARUUceGc=
X-Google-Smtp-Source: AGHT+IG5unstQaaQcPjn0DiH3jaE5oSh1mV8bO1AA2CK0b4+WePZuy1yQ/9D0Wa0H4hxceCfnxGxBg==
X-Received: by 2002:a05:6830:439e:b0:7c7:68d8:f6f5 with SMTP id 46e09a7af769-7ce4663b84dmr2566399a34.3.1767716894875;
        Tue, 06 Jan 2026 08:28:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:13 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] kbuild: Support a FIT_EXTRA_ARGS environment variable
Date: Tue,  6 Jan 2026 09:27:34 -0700
Message-ID: <20260106162738.2605574-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases it is useful to be able to pass additional flags to the
make_fit.py script. For example, since ramdisks are typically large,
passing -E to use external data can be helpful.

Add a new FIT_EXTRA_ARGS variable for this.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---

Changes in v9:
- Rename the variable to FIT_EXTRA_ARGS

Changes in v7:
- Add a new patch with the MAKE_FIT_FLAGS change

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..e8da632d5348 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,7 +400,7 @@ FIT_COMPRESSION ?= gzip
 
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0


