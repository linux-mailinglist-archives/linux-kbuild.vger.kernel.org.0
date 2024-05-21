Return-Path: <linux-kbuild+bounces-1906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 969ED8CA82C
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 08:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319261F2230F
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2024 06:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE91C4D9E3;
	Tue, 21 May 2024 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eJyuYSfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C704F885
	for <linux-kbuild@vger.kernel.org>; Tue, 21 May 2024 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274278; cv=none; b=sCV1DZegxi6Y2t3vyZ2TaEP97utTSvec1vLpng3MoVJTVcsWd+nvYlQTKwiUHX+NxhpkKTFLeWqUSm5cKrG7croGdufAw1VL7wr67/WN6VhQg4bZwP+mnycfw9JV4jRxyA+kdUBLS92z9tksoLlDwDZNFc4cKOQDP4Ml3N67Oww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274278; c=relaxed/simple;
	bh=tlZwiytyy7GUSuUxcwpKbDSIVmkSh/Ozgpm8JddXkGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cylqZvEcIJjSj8LkBE3XBhN9WiQ1AbHlzuPC1baid3beTNoBUbi8YKzsPXDr8h/PX4nKBUNFlnSOJty40S94/Wo4ZkO+5GN6+qKj3LcVuciN5Afzm6+h9KSMLUjZ4A9x7NP0+UvT3byOo0hqtlZ/7rNHxnbBYk7BO+MoqTQYFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eJyuYSfR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ecd3867556so100902835ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 23:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716274276; x=1716879076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiOnX2/+/NaKrnz1dB8iIjPpDkqOamcc1T4O8qQETy8=;
        b=eJyuYSfRkvrN0xS5Zvk/jVk9fBGIH44YvVVYl2mlnexQ6UJLNc85cwLaZEU0NFMd3r
         DXIpqh6gA8m0s1kKtBFuSESXviSsKUQg+tcHv2EPx5Oc67w3kpspbJX9RqYGdESjSsZX
         yf/BKVlFeGbnV/mVXC8YoOuZA9euGvpF3yJ2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716274276; x=1716879076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiOnX2/+/NaKrnz1dB8iIjPpDkqOamcc1T4O8qQETy8=;
        b=dOjN9Rq7PLPhO/KibN3C9St6BILtsZ7A2TNU0Djk141PDkUZ1SIlZWtJlRz/nJDtdn
         6OfJbi4Rkka48pUdgvD0jFVE7SibuTyer2bXHODZ+H5Y8mSz4G8ApgGW0SycI4M4pN9R
         SG9sQuzVg+Hu0bHwPfAVY+6jdtofj6z4/IhIBH4K+COf8cKjs1XFjxf+ZMHuMJ0azcoA
         f6G1SupM9liSXKhCRfaMMIZSsmxs+ouWlDplgG7hBSmCHE3QQSuay0vVQBGd68EpNl0g
         hIYjgnlO7qL6ddvDg02JHqbnlEm9bqRYeMb6tEUJiIINTry0s3fK5JQQ74UmFPdmZUO0
         yYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXHnxHbbwwykNtrGwvYDRSg6LkOQi5XNAnTWa4I2YZe3dfGK99ntmPA1HaRpAXl7REgDXHTw+waH0FoZi6riaveLQcPP/58kaSPzdB
X-Gm-Message-State: AOJu0YwwAXQcOst0Qd7TsHIvjEz2HoXnxFC3PDOwZ1eAcF7PKbp8FZxg
	7E7PFNVNLkbhl0MK3KRZTiLoVPy0NieYdrAeqUBSanu6InwUBMwJ6lioVPn35A==
X-Google-Smtp-Source: AGHT+IFRGCP8dFUwAhY6qs1u8kwpNhPXOrM44sdM7NC90XH1PWwnNaqP5n/f4xBogtT8DcTByxtu5g==
X-Received: by 2002:a05:6a20:9746:b0:1aa:6a28:cf6e with SMTP id adf61e73a8af0-1afde1c5506mr29051396637.48.1716274276630;
        Mon, 20 May 2024 23:51:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f8a5:77aa:5a0d:e30c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30644ad48sm23100985ad.169.2024.05.20.23.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 23:51:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] scripts/make_fit: Drop fdt image entry compatible string
Date: Tue, 21 May 2024 14:51:04 +0800
Message-ID: <20240521065107.30371-2-wenst@chromium.org>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
In-Reply-To: <20240521065107.30371-1-wenst@chromium.org>
References: <20240521065107.30371-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the FIT image spec, the compatible string in the fdt image
node or any image node specifies the method to load the image, not the
compatible string embedded in the FDT or used for matching.

Drop the compatible string from the fdt image entry node.

While at it also fix up a typo in the document section of output_dtb.

Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 scripts/make_fit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 3de90c5a094b..263147df80a4 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -190,7 +190,7 @@ def output_dtb(fsw, seq, fname, arch, compress):
     Args:
         fsw (libfdt.FdtSw): Object to use for writing
         seq (int): Sequence number (1 for first)
-        fmame (str): Filename containing the DTB
+        fname (str): Filename containing the DTB
         arch: FIT architecture, e.g. 'arm64'
         compress (str): Compressed algorithm, e.g. 'gzip'
 
@@ -211,7 +211,6 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property_string('type', 'flat_dt')
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
-        fsw.property('compatible', bytes(compat))
 
         with open(fname, 'rb') as inf:
             compressed = compress_data(inf, compress)
-- 
2.45.0.215.g3402c0e53f-goog


