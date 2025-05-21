Return-Path: <linux-kbuild+bounces-7206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C4ABF724
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 16:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027BB3A10B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 14:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7B814F117;
	Wed, 21 May 2025 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZJosEJv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF318BBB0
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836367; cv=none; b=aKQRD0iFV4RP1cZns2EXawxo8mgl2bv4vtovVY6s4B1n8p23BA6z3yAm2M7JHJkcRXEKVO9j8rWwhTy20vPWd3DAvAVPKjzg5BCw2QJnvP4EB/gF9A6w/1JUhfIdQG3m0wh4b3maGeI9mlmovFOEzHrXSWM/+NK+xz2Bo0J0xR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836367; c=relaxed/simple;
	bh=hFL2ujEDC0/s9FC+jBgqp1Pu6tyNrz9PxLzmZTyHSTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oJHYFN05xRho3j6FukFYzF/GnamLYZUj40eeqmzmx/drJ6d2RY2MRmSe3TQoZOjVTiQG0Iaa96jOi5HXl11hzJoRldwbempufEhTByEws6g+UKezDeQi+rsnR0bfLbZ1rspgpybbz+pPivy4bqh7hHlM4eD9Ed8x5qIWOQXzYBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZJosEJv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-232054aa4ebso33855515ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836365; x=1748441165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0D+OBx+qbfyLpoP20h2tdqwb3jyc+nYmjgOaV1nr5g=;
        b=IZJosEJvVFPnNXaCPOOOUMLRioFflDNVfxoAMo1AAH+57S/UciW+vXoE6iW6Fql2wP
         ioPgZ473i6Jqe6UykuYEJT8fsaR1xccH9bQU7+h0JYcOAbekojci8ia4YjlsxGN7NUyH
         d9zWzhuUf8fKu507Q9SItexH9bRfRsTh74rwF8dWZHx9QyI78ZGTtZIS0oLVc22RmMGw
         hchYuMXVtPyNKzO9hlpY64fnTweN/insBSGePnW86vaXrLAXG/yq2Z8UWLuJGJJ2D+mw
         0RalHs3Dczt4JIPxc42Lv/v8Qnmn0jY39DpUobmIQ421T6241ZN2/joBsGHlldW7k4vM
         s6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836365; x=1748441165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0D+OBx+qbfyLpoP20h2tdqwb3jyc+nYmjgOaV1nr5g=;
        b=GqAH4hQS5PXxpo/L656iWdFYLPyN0L3CxCm6NnbfLW4YbcIVArDUq3ljFzAIQQK77n
         SLwbG3yUR+kRecqN5sNxnRlZZuVRJNNl5MRiXaPmVUE8A3s4I7hTf8/lDlD69vNr+Vhn
         jWA7ntA3MeWlDe8N/f940zqfSDWShc9nJNz0ln4p+BeZgqgDHM+TsKCaW1fIOlr88kEi
         RX69i1zk1c7HHrKnTSuFs4ZTR8sPXNIPELL2afhgYvFG9rrINCUWC824q63Sny4uQVK3
         XxV1kPRWq8hSyBN64d+veiuqxe8dRU6INHx6DGmahvvd0n37SRbOBni5DzkjIYXXeHSZ
         Wowg==
X-Gm-Message-State: AOJu0YwnSaIzjV0TroDfkwWSuCz1XX85LLkcOGYx4CguUjF1Dq2jXSe9
	EHf6j6U3yjIy/cI6j8f+yMaSmqSQD6KWaHH04D1cDDeR89s+VwQXSbDyeWRFcjSD
X-Gm-Gg: ASbGnctRunac1HGAK+Z2jABp1L+eJAyIrEUe5B0CfPJu9ApXftibuJ7LhzxGh4X7gKS
	nNczG/COE9pE+Y2Dw9VHreqwoKugGAMmdI4xdW8halEe2JoOrHi33LYFUVBEFrSlVd5/tLk7v3E
	1QrOPpOrF8O/9KHNpzSHiaECIc8M3tEH/AwZyL6YsVXWVDQu2R84rE0YZOTuFaHlSQgJPWYchRq
	VtTsxLbOCnmNf1RtxsPSZN5+2G+t6mcrjwQZ7OplPzt/5uNT2k9psNMKZMNW+jXA4jqt1lVnfJb
	O7rKkD4LY73n0yamsbBr+w2y8vk5E659Eabku4I41d1nGJKDq7KRINJezNWGKqXQasI=
X-Google-Smtp-Source: AGHT+IGZ86dZEM6TtFaNaWkZYHkphvdwC893FwIQG+ozIbf+NqbM5vQZXc88JuM6WP/8vuTKeMXbmg==
X-Received: by 2002:a17:902:da86:b0:220:cb1a:da5 with SMTP id d9443c01a7336-231d4596c6cmr314162295ad.40.1747836365073;
        Wed, 21 May 2025 07:06:05 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed276csm93164275ad.229.2025.05.21.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:06:04 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	skhan@linuxfoundation.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH] kconfig/nconf: Replace deprecated strncpy() with strscpy()
Date: Wed, 21 May 2025 19:35:54 +0530
Message-Id: <20250521140554.3551487-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of strncpy() does not guarantee null-termination and is deprecated in the kernel.
This change replaces it with strscpy(), which ensures null-termination and returns a
value indicating truncation.

In this case, padding the destination buffer is not necessary since the string is used
in a UI context as a null-terminated string. Therefore, strscpy() is a safer and more
efficient replacement. See: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 scripts/kconfig/nconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index c0b2dabf6c89..67ee33fe16ef 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -589,7 +589,7 @@ static void item_add_str(const char *fmt, ...)
 	va_end(ap);
 	snprintf(tmp_str, sizeof(tmp_str), "%s%s",
 			k_menu_items[index].str, new_str);
-	strncpy(k_menu_items[index].str,
+	strscpy(k_menu_items[index].str,
 		tmp_str,
 		sizeof(k_menu_items[index].str));
 
-- 
2.34.1


