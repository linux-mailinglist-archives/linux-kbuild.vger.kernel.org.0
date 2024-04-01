Return-Path: <linux-kbuild+bounces-1431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67625893735
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 04:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613DF1C20BF4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Apr 2024 02:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31E44A12;
	Mon,  1 Apr 2024 02:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQBp/Mtd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600104C6B
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Apr 2024 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939385; cv=none; b=TkPBAMGPKgIeSAIA08yYUqctdJQGoGbtonXeJlgf0G436N84GgCLQBHaHN4mv7pyXS1y/NgtCMmBBpAs0AHXPNXhic4KFuAlAd4rPcWufjZ32f72Iux0Z6vFbWybNiBVyo+Ke3cMtGTzz62keqN9gyletmnyb2MxhjFseKDezTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939385; c=relaxed/simple;
	bh=gDafPEHUcRHgE+i2fhiUjrViNZ+i8i+eh1Rr3Wr661A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3kWZGazMFH+ZRSD3dmlh8DCo8OznLgoIh7m3pw1J6TOYqW9yyA5rt2+Zodt2snfivpnTx6obYuRGZQfuAGJRyicVx1i7PKcEU3Q+K+7G0CAmqHJ3s4Y1fBfJbE6FLZF82fcp5V2RIH8sYGfD8GUlXOAkIXwkCtE3pMBR6ogeoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQBp/Mtd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516a01c8490so915822e87.1
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Mar 2024 19:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939375; x=1712544175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmQ8XsDPJEnYa3U4c4kiHFBZsgtfTkiwksOQG4KQqQs=;
        b=KQBp/Mtdquws3xbdlc67lGXD82q39EfnHuHWpGCknBYj3eyfXshiSmE8m4fKiSuzgm
         +BC6fj61j4XBWujT8fK6Aj02wa1grgAtJAO2HGFgyx9/Y064asEmTpvczzD80O7NsHL1
         +3uqArtLacSzVBsYgEFQLAigMqFLsQ20gjH3Uh4JR8BpnsPTmCXLImAPIt8Am28Tx58/
         dhaD+ZYATq4mJLVZExbxI2wWlh6/6Q1NLQcdb3Q70OxdLKqEEKCJqgW8uTcHHzF4fO1n
         YgSlGGiAnTL6ZNEGET81RPwrne0iaFVrG0cPN7D0UOGJ3NXxOsE0Ug5bw+fKLH/KOlNC
         sOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939375; x=1712544175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmQ8XsDPJEnYa3U4c4kiHFBZsgtfTkiwksOQG4KQqQs=;
        b=TPD1qAo+aSK0mHDiqUTJFFJzf10ijYUesktFUGFQ7E8Ivp4tDMMlUrs2d0i79xhMz9
         VY49Tpk8yHpkJ//DY7GllrvEEO9u+OPH58GA6cUC3GrJSkkIyKpmiy5WVOhHtsiFdiHn
         e0LiYvQWQcw5cBOcOZMLxCnjyOlYpOExfwwb+vDbcIBYh6JkIVw2x0zK5L2qFcdtRg5l
         jhxCgOVT0EDAw1OSpbKvEh40qvniDC7ybDLhBZrUY0O4dDLU3BizkIIJ7G1ez1K+xBD5
         saleHcUeLZ4w2bp3Zg0KrqCUpP+0I/7ojRcP7pKefF1wIPtZEJodSVSnhbFhlJ+PBYGS
         3xxA==
X-Gm-Message-State: AOJu0YxP3Y2yUs7h/SKNauXtTn4k27ZwdklOwyYDYXVt4J3LY7XNXdpk
	8dOGta4U0XWG4L0NlYXQmNLn9Tqtj/sSyHGVj3DkodA3uDwaKNMY+ci/b+n5Deo=
X-Google-Smtp-Source: AGHT+IGPOvuFIPwQvR+kB9GUKUYA1TDy3nLCTgD+GIC8fSnzXWj7x3h3yl5Ao8Ke+TRZ2+r+ljbrYA==
X-Received: by 2002:a05:6512:15a6:b0:516:a1ad:cedd with SMTP id bp38-20020a05651215a600b00516a1adceddmr1738501lfb.14.1711939375483;
        Sun, 31 Mar 2024 19:42:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:38 +0300
Subject: [PATCH v5 08/18] drm/msm: import A5xx XML display registers
 database
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-8-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=158366;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gDafPEHUcRHgE+i2fhiUjrViNZ+i8i+eh1Rr3Wr661A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxqXvGp/8UzFfbGcE+1Z1I5vzS7Y2dNkwcK+4eqc3KYr+
 o8cfdU6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARg2D2/94tekJJRzNN/55n
 6OZdf+e2zNQ9S5LNmQy+ioqfPmR60WduxfxelvKYv9nbHVy9nvrMM2DK0jBUbaysyxUP5eu1ETh
 ctz7qtJFIqFBda4rv3/U9bP77dau+Zd+y3RWxVn/zjS0PzP4q7pD2tLnc9ntPmdBbxTs+2k8uvH
 sdZzyFo1+Ik+GNV6R9rOAyfq1j4fU5yWGNGg809Fb9eDH1Xdc+w4k6Dda+Ga+8PjkYyTa9FJC7P
 VP2o/CMG0Vaxw5ldG5b6/Nm+buitcFavlOmre1l8tB+PuWAZfy/CNl+/kU7rPw/X/UUrViztGu2
 1dtTeaU3dF7tm/ZS6vwtxkYh49/FO/fnp76yinLp2bcOAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Import Adreno registers database for A5xx from the Mesa, commit
639488f924d9 ("freedreno/registers: limit the rules schema").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml | 3039 +++++++++++++++++++++++++
 1 file changed, 3039 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a5xx.xml b/drivers/gpu/drm/msm/registers/adreno/a5xx.xml
new file mode 100644
index 000000000000..bd8df5945166
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a5xx.xml
@@ -0,0 +1,3039 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<enum name="a5xx_color_fmt">
+	<value value="0x02" name="RB5_A8_UNORM"/>
+	<value value="0x03" name="RB5_R8_UNORM"/>
+	<value value="0x04" name="RB5_R8_SNORM"/>
+	<value value="0x05" name="RB5_R8_UINT"/>
+	<value value="0x06" name="RB5_R8_SINT"/>
+	<value value="0x08" name="RB5_R4G4B4A4_UNORM"/>
+	<value value="0x0a" name="RB5_R5G5B5A1_UNORM"/>
+	<value value="0x0e" name="RB5_R5G6B5_UNORM"/>
+	<value value="0x0f" name="RB5_R8G8_UNORM"/>
+	<value value="0x10" name="RB5_R8G8_SNORM"/>
+	<value value="0x11" name="RB5_R8G8_UINT"/>
+	<value value="0x12" name="RB5_R8G8_SINT"/>
+	<value value="0x15" name="RB5_R16_UNORM"/>
+	<value value="0x16" name="RB5_R16_SNORM"/>
+	<value value="0x17" name="RB5_R16_FLOAT"/>
+	<value value="0x18" name="RB5_R16_UINT"/>
+	<value value="0x19" name="RB5_R16_SINT"/>
+	<value value="0x30" name="RB5_R8G8B8A8_UNORM"/>
+	<value value="0x31" name="RB5_R8G8B8_UNORM"/>
+	<value value="0x32" name="RB5_R8G8B8A8_SNORM"/>
+	<value value="0x33" name="RB5_R8G8B8A8_UINT"/>
+	<value value="0x34" name="RB5_R8G8B8A8_SINT"/>
+	<value value="0x37" name="RB5_R10G10B10A2_UNORM"/>  <!-- GL_RGB10_A2 -->
+	<value value="0x3a" name="RB5_R10G10B10A2_UINT"/>   <!-- GL_RGB10_A2UI -->
+	<value value="0x42" name="RB5_R11G11B10_FLOAT"/>    <!-- GL_R11F_G11F_B10F -->
+	<value value="0x43" name="RB5_R16G16_UNORM"/>
+	<value value="0x44" name="RB5_R16G16_SNORM"/>
+	<value value="0x45" name="RB5_R16G16_FLOAT"/>
+	<value value="0x46" name="RB5_R16G16_UINT"/>
+	<value value="0x47" name="RB5_R16G16_SINT"/>
+	<value value="0x4a" name="RB5_R32_FLOAT"/>
+	<value value="0x4b" name="RB5_R32_UINT"/>
+	<value value="0x4c" name="RB5_R32_SINT"/>
+	<value value="0x60" name="RB5_R16G16B16A16_UNORM"/>
+	<value value="0x61" name="RB5_R16G16B16A16_SNORM"/>
+	<value value="0x62" name="RB5_R16G16B16A16_FLOAT"/>
+	<value value="0x63" name="RB5_R16G16B16A16_UINT"/>
+	<value value="0x64" name="RB5_R16G16B16A16_SINT"/>
+	<value value="0x67" name="RB5_R32G32_FLOAT"/>
+	<value value="0x68" name="RB5_R32G32_UINT"/>
+	<value value="0x69" name="RB5_R32G32_SINT"/>
+	<value value="0x82" name="RB5_R32G32B32A32_FLOAT"/>
+	<value value="0x83" name="RB5_R32G32B32A32_UINT"/>
+	<value value="0x84" name="RB5_R32G32B32A32_SINT"/>
+
+	<value value="0xff" name="RB5_NONE"/>
+</enum>
+
+<enum name="a5xx_tile_mode">
+	<value name="TILE5_LINEAR" value="0"/>
+	<value name="TILE5_2" value="2"/>
+	<value name="TILE5_3" value="3"/>
+</enum>
+
+<enum name="a5xx_vtx_fmt" prefix="chipset">
+	<value value="0x03" name="VFMT5_8_UNORM"/>
+	<value value="0x04" name="VFMT5_8_SNORM"/>
+	<value value="0x05" name="VFMT5_8_UINT"/>
+	<value value="0x06" name="VFMT5_8_SINT"/>
+
+	<value value="0x0f" name="VFMT5_8_8_UNORM"/>
+	<value value="0x10" name="VFMT5_8_8_SNORM"/>
+	<value value="0x11" name="VFMT5_8_8_UINT"/>
+	<value value="0x12" name="VFMT5_8_8_SINT"/>
+
+	<value value="0x15" name="VFMT5_16_UNORM"/>
+	<value value="0x16" name="VFMT5_16_SNORM"/>
+	<value value="0x17" name="VFMT5_16_FLOAT"/>
+	<value value="0x18" name="VFMT5_16_UINT"/>
+	<value value="0x19" name="VFMT5_16_SINT"/>
+
+	<value value="0x21" name="VFMT5_8_8_8_UNORM"/>
+	<value value="0x22" name="VFMT5_8_8_8_SNORM"/>
+	<value value="0x23" name="VFMT5_8_8_8_UINT"/>
+	<value value="0x24" name="VFMT5_8_8_8_SINT"/>
+
+	<value value="0x30" name="VFMT5_8_8_8_8_UNORM"/>
+	<value value="0x32" name="VFMT5_8_8_8_8_SNORM"/>
+	<value value="0x33" name="VFMT5_8_8_8_8_UINT"/>
+	<value value="0x34" name="VFMT5_8_8_8_8_SINT"/>
+
+	<value value="0x36" name="VFMT5_10_10_10_2_UNORM"/>
+	<value value="0x39" name="VFMT5_10_10_10_2_SNORM"/>
+	<value value="0x3a" name="VFMT5_10_10_10_2_UINT"/>
+	<value value="0x3b" name="VFMT5_10_10_10_2_SINT"/>
+
+	<value value="0x42" name="VFMT5_11_11_10_FLOAT"/>
+
+	<value value="0x43" name="VFMT5_16_16_UNORM"/>
+	<value value="0x44" name="VFMT5_16_16_SNORM"/>
+	<value value="0x45" name="VFMT5_16_16_FLOAT"/>
+	<value value="0x46" name="VFMT5_16_16_UINT"/>
+	<value value="0x47" name="VFMT5_16_16_SINT"/>
+
+	<value value="0x48" name="VFMT5_32_UNORM"/>
+	<value value="0x49" name="VFMT5_32_SNORM"/>
+	<value value="0x4a" name="VFMT5_32_FLOAT"/>
+	<value value="0x4b" name="VFMT5_32_UINT"/>
+	<value value="0x4c" name="VFMT5_32_SINT"/>
+	<value value="0x4d" name="VFMT5_32_FIXED"/>
+
+	<value value="0x58" name="VFMT5_16_16_16_UNORM"/>
+	<value value="0x59" name="VFMT5_16_16_16_SNORM"/>
+	<value value="0x5a" name="VFMT5_16_16_16_FLOAT"/>
+	<value value="0x5b" name="VFMT5_16_16_16_UINT"/>
+	<value value="0x5c" name="VFMT5_16_16_16_SINT"/>
+
+	<value value="0x60" name="VFMT5_16_16_16_16_UNORM"/>
+	<value value="0x61" name="VFMT5_16_16_16_16_SNORM"/>
+	<value value="0x62" name="VFMT5_16_16_16_16_FLOAT"/>
+	<value value="0x63" name="VFMT5_16_16_16_16_UINT"/>
+	<value value="0x64" name="VFMT5_16_16_16_16_SINT"/>
+
+	<value value="0x65" name="VFMT5_32_32_UNORM"/>
+	<value value="0x66" name="VFMT5_32_32_SNORM"/>
+	<value value="0x67" name="VFMT5_32_32_FLOAT"/>
+	<value value="0x68" name="VFMT5_32_32_UINT"/>
+	<value value="0x69" name="VFMT5_32_32_SINT"/>
+	<value value="0x6a" name="VFMT5_32_32_FIXED"/>
+
+	<value value="0x70" name="VFMT5_32_32_32_UNORM"/>
+	<value value="0x71" name="VFMT5_32_32_32_SNORM"/>
+	<value value="0x72" name="VFMT5_32_32_32_UINT"/>
+	<value value="0x73" name="VFMT5_32_32_32_SINT"/>
+	<value value="0x74" name="VFMT5_32_32_32_FLOAT"/>
+	<value value="0x75" name="VFMT5_32_32_32_FIXED"/>
+
+	<value value="0x80" name="VFMT5_32_32_32_32_UNORM"/>
+	<value value="0x81" name="VFMT5_32_32_32_32_SNORM"/>
+	<value value="0x82" name="VFMT5_32_32_32_32_FLOAT"/>
+	<value value="0x83" name="VFMT5_32_32_32_32_UINT"/>
+	<value value="0x84" name="VFMT5_32_32_32_32_SINT"/>
+	<value value="0x85" name="VFMT5_32_32_32_32_FIXED"/>
+
+	<value value="0xff" name="VFMT5_NONE"/>
+</enum>
+
+<enum name="a5xx_tex_fmt">
+	<value value="0x02" name="TFMT5_A8_UNORM"/>
+	<value value="0x03" name="TFMT5_8_UNORM"/>
+	<value value="0x04" name="TFMT5_8_SNORM"/>
+	<value value="0x05" name="TFMT5_8_UINT"/>
+	<value value="0x06" name="TFMT5_8_SINT"/>
+	<value value="0x08" name="TFMT5_4_4_4_4_UNORM"/>
+	<value value="0x0a" name="TFMT5_5_5_5_1_UNORM"/>
+	<value value="0x0e" name="TFMT5_5_6_5_UNORM"/>
+	<value value="0x0f" name="TFMT5_8_8_UNORM"/>
+	<value value="0x10" name="TFMT5_8_8_SNORM"/>
+	<value value="0x11" name="TFMT5_8_8_UINT"/>
+	<value value="0x12" name="TFMT5_8_8_SINT"/>
+	<value value="0x13" name="TFMT5_L8_A8_UNORM"/>
+	<value value="0x15" name="TFMT5_16_UNORM"/>
+	<value value="0x16" name="TFMT5_16_SNORM"/>
+	<value value="0x17" name="TFMT5_16_FLOAT"/>
+	<value value="0x18" name="TFMT5_16_UINT"/>
+	<value value="0x19" name="TFMT5_16_SINT"/>
+	<value value="0x30" name="TFMT5_8_8_8_8_UNORM"/>
+	<value value="0x31" name="TFMT5_8_8_8_UNORM"/>
+	<value value="0x32" name="TFMT5_8_8_8_8_SNORM"/>
+	<value value="0x33" name="TFMT5_8_8_8_8_UINT"/>
+	<value value="0x34" name="TFMT5_8_8_8_8_SINT"/>
+	<value value="0x35" name="TFMT5_9_9_9_E5_FLOAT"/>
+	<value value="0x36" name="TFMT5_10_10_10_2_UNORM"/>
+	<value value="0x3a" name="TFMT5_10_10_10_2_UINT"/>
+	<value value="0x42" name="TFMT5_11_11_10_FLOAT"/>
+	<value value="0x43" name="TFMT5_16_16_UNORM"/>
+	<value value="0x44" name="TFMT5_16_16_SNORM"/>
+	<value value="0x45" name="TFMT5_16_16_FLOAT"/>
+	<value value="0x46" name="TFMT5_16_16_UINT"/>
+	<value value="0x47" name="TFMT5_16_16_SINT"/>
+	<value value="0x4a" name="TFMT5_32_FLOAT"/>
+	<value value="0x4b" name="TFMT5_32_UINT"/>
+	<value value="0x4c" name="TFMT5_32_SINT"/>
+	<value value="0x60" name="TFMT5_16_16_16_16_UNORM"/>
+	<value value="0x61" name="TFMT5_16_16_16_16_SNORM"/>
+	<value value="0x62" name="TFMT5_16_16_16_16_FLOAT"/>
+	<value value="0x63" name="TFMT5_16_16_16_16_UINT"/>
+	<value value="0x64" name="TFMT5_16_16_16_16_SINT"/>
+	<value value="0x67" name="TFMT5_32_32_FLOAT"/>
+	<value value="0x68" name="TFMT5_32_32_UINT"/>
+	<value value="0x69" name="TFMT5_32_32_SINT"/>
+	<value value="0x72" name="TFMT5_32_32_32_UINT"/>
+	<value value="0x73" name="TFMT5_32_32_32_SINT"/>
+	<value value="0x74" name="TFMT5_32_32_32_FLOAT"/>
+	<value value="0x82" name="TFMT5_32_32_32_32_FLOAT"/>
+	<value value="0x83" name="TFMT5_32_32_32_32_UINT"/>
+	<value value="0x84" name="TFMT5_32_32_32_32_SINT"/>
+	<value value="0xa0" name="TFMT5_X8Z24_UNORM"/>
+
+	<value value="0xab" name="TFMT5_ETC2_RG11_UNORM"/>
+	<value value="0xac" name="TFMT5_ETC2_RG11_SNORM"/>
+	<value value="0xad" name="TFMT5_ETC2_R11_UNORM"/>
+	<value value="0xae" name="TFMT5_ETC2_R11_SNORM"/>
+	<value value="0xaf" name="TFMT5_ETC1"/>
+	<value value="0xb0" name="TFMT5_ETC2_RGB8"/>
+	<value value="0xb1" name="TFMT5_ETC2_RGBA8"/>
+	<value value="0xb2" name="TFMT5_ETC2_RGB8A1"/>
+	<value value="0xb3" name="TFMT5_DXT1"/>
+	<value value="0xb4" name="TFMT5_DXT3"/>
+	<value value="0xb5" name="TFMT5_DXT5"/>
+	<value value="0xb7" name="TFMT5_RGTC1_UNORM"/>
+	<value value="0xb8" name="TFMT5_RGTC1_SNORM"/>
+	<value value="0xbb" name="TFMT5_RGTC2_UNORM"/>
+	<value value="0xbc" name="TFMT5_RGTC2_SNORM"/>
+	<value value="0xbe" name="TFMT5_BPTC_UFLOAT"/>
+	<value value="0xbf" name="TFMT5_BPTC_FLOAT"/>
+	<value value="0xc0" name="TFMT5_BPTC"/>
+	<value value="0xc1" name="TFMT5_ASTC_4x4"/>
+	<value value="0xc2" name="TFMT5_ASTC_5x4"/>
+	<value value="0xc3" name="TFMT5_ASTC_5x5"/>
+	<value value="0xc4" name="TFMT5_ASTC_6x5"/>
+	<value value="0xc5" name="TFMT5_ASTC_6x6"/>
+	<value value="0xc6" name="TFMT5_ASTC_8x5"/>
+	<value value="0xc7" name="TFMT5_ASTC_8x6"/>
+	<value value="0xc8" name="TFMT5_ASTC_8x8"/>
+	<value value="0xc9" name="TFMT5_ASTC_10x5"/>
+	<value value="0xca" name="TFMT5_ASTC_10x6"/>
+	<value value="0xcb" name="TFMT5_ASTC_10x8"/>
+	<value value="0xcc" name="TFMT5_ASTC_10x10"/>
+	<value value="0xcd" name="TFMT5_ASTC_12x10"/>
+	<value value="0xce" name="TFMT5_ASTC_12x12"/>
+
+	<value value="0xff" name="TFMT5_NONE"/>
+</enum>
+
+<enum name="a5xx_depth_format">
+	<value name="DEPTH5_NONE" value="0"/>
+	<value name="DEPTH5_16" value="1"/>
+	<value name="DEPTH5_24_8" value="2"/>
+	<value name="DEPTH5_32" value="4"/>
+</enum>
+
+<enum name="a5xx_blit_buf">
+	<value value="0" name="BLIT_MRT0"/>
+	<value value="1" name="BLIT_MRT1"/>
+	<value value="2" name="BLIT_MRT2"/>
+	<value value="3" name="BLIT_MRT3"/>
+	<value value="4" name="BLIT_MRT4"/>
+	<value value="5" name="BLIT_MRT5"/>
+	<value value="6" name="BLIT_MRT6"/>
+	<value value="7" name="BLIT_MRT7"/>
+	<value value="8" name="BLIT_ZS"/>       <!-- depth or combined depth+stencil -->
+	<value value="9" name="BLIT_S"/>        <!-- separate stencil -->
+</enum>
+
+<!-- see comment in a4xx.xml about script to extract countables from test-perf output -->
+<enum name="a5xx_cp_perfcounter_select">
+	<value value="0" name="PERF_CP_ALWAYS_COUNT"/>
+	<value value="1" name="PERF_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="2" name="PERF_CP_BUSY_CYCLES"/>
+	<value value="3" name="PERF_CP_PFP_IDLE"/>
+	<value value="4" name="PERF_CP_PFP_BUSY_WORKING"/>
+	<value value="5" name="PERF_CP_PFP_STALL_CYCLES_ANY"/>
+	<value value="6" name="PERF_CP_PFP_STARVE_CYCLES_ANY"/>
+	<value value="7" name="PERF_CP_PFP_ICACHE_MISS"/>
+	<value value="8" name="PERF_CP_PFP_ICACHE_HIT"/>
+	<value value="9" name="PERF_CP_PFP_MATCH_PM4_PKT_PROFILE"/>
+	<value value="10" name="PERF_CP_ME_BUSY_WORKING"/>
+	<value value="11" name="PERF_CP_ME_IDLE"/>
+	<value value="12" name="PERF_CP_ME_STARVE_CYCLES_ANY"/>
+	<value value="13" name="PERF_CP_ME_FIFO_EMPTY_PFP_IDLE"/>
+	<value value="14" name="PERF_CP_ME_FIFO_EMPTY_PFP_BUSY"/>
+	<value value="15" name="PERF_CP_ME_FIFO_FULL_ME_BUSY"/>
+	<value value="16" name="PERF_CP_ME_FIFO_FULL_ME_NON_WORKING"/>
+	<value value="17" name="PERF_CP_ME_STALL_CYCLES_ANY"/>
+	<value value="18" name="PERF_CP_ME_ICACHE_MISS"/>
+	<value value="19" name="PERF_CP_ME_ICACHE_HIT"/>
+	<value value="20" name="PERF_CP_NUM_PREEMPTIONS"/>
+	<value value="21" name="PERF_CP_PREEMPTION_REACTION_DELAY"/>
+	<value value="22" name="PERF_CP_PREEMPTION_SWITCH_OUT_TIME"/>
+	<value value="23" name="PERF_CP_PREEMPTION_SWITCH_IN_TIME"/>
+	<value value="24" name="PERF_CP_DEAD_DRAWS_IN_BIN_RENDER"/>
+	<value value="25" name="PERF_CP_PREDICATED_DRAWS_KILLED"/>
+	<value value="26" name="PERF_CP_MODE_SWITCH"/>
+	<value value="27" name="PERF_CP_ZPASS_DONE"/>
+	<value value="28" name="PERF_CP_CONTEXT_DONE"/>
+	<value value="29" name="PERF_CP_CACHE_FLUSH"/>
+	<value value="30" name="PERF_CP_LONG_PREEMPTIONS"/>
+</enum>
+
+<enum name="a5xx_rbbm_perfcounter_select">
+	<value value="0" name="PERF_RBBM_ALWAYS_COUNT"/>
+	<value value="1" name="PERF_RBBM_ALWAYS_ON"/>
+	<value value="2" name="PERF_RBBM_TSE_BUSY"/>
+	<value value="3" name="PERF_RBBM_RAS_BUSY"/>
+	<value value="4" name="PERF_RBBM_PC_DCALL_BUSY"/>
+	<value value="5" name="PERF_RBBM_PC_VSD_BUSY"/>
+	<value value="6" name="PERF_RBBM_STATUS_MASKED"/>
+	<value value="7" name="PERF_RBBM_COM_BUSY"/>
+	<value value="8" name="PERF_RBBM_DCOM_BUSY"/>
+	<value value="9" name="PERF_RBBM_VBIF_BUSY"/>
+	<value value="10" name="PERF_RBBM_VSC_BUSY"/>
+	<value value="11" name="PERF_RBBM_TESS_BUSY"/>
+	<value value="12" name="PERF_RBBM_UCHE_BUSY"/>
+	<value value="13" name="PERF_RBBM_HLSQ_BUSY"/>
+</enum>
+
+<enum name="a5xx_pc_perfcounter_select">
+	<value value="0" name="PERF_PC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_PC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_PC_STALL_CYCLES_VFD"/>
+	<value value="3" name="PERF_PC_STALL_CYCLES_TSE"/>
+	<value value="4" name="PERF_PC_STALL_CYCLES_VPC"/>
+	<value value="5" name="PERF_PC_STALL_CYCLES_UCHE"/>
+	<value value="6" name="PERF_PC_STALL_CYCLES_TESS"/>
+	<value value="7" name="PERF_PC_STALL_CYCLES_TSE_ONLY"/>
+	<value value="8" name="PERF_PC_STALL_CYCLES_VPC_ONLY"/>
+	<value value="9" name="PERF_PC_PASS1_TF_STALL_CYCLES"/>
+	<value value="10" name="PERF_PC_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="11" name="PERF_PC_STARVE_CYCLES_FOR_TESS_FACTOR"/>
+	<value value="12" name="PERF_PC_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="13" name="PERF_PC_STARVE_CYCLES_FOR_POSITION"/>
+	<value value="14" name="PERF_PC_STARVE_CYCLES_DI"/>
+	<value value="15" name="PERF_PC_VIS_STREAMS_LOADED"/>
+	<value value="16" name="PERF_PC_INSTANCES"/>
+	<value value="17" name="PERF_PC_VPC_PRIMITIVES"/>
+	<value value="18" name="PERF_PC_DEAD_PRIM"/>
+	<value value="19" name="PERF_PC_LIVE_PRIM"/>
+	<value value="20" name="PERF_PC_VERTEX_HITS"/>
+	<value value="21" name="PERF_PC_IA_VERTICES"/>
+	<value value="22" name="PERF_PC_IA_PRIMITIVES"/>
+	<value value="23" name="PERF_PC_GS_PRIMITIVES"/>
+	<value value="24" name="PERF_PC_HS_INVOCATIONS"/>
+	<value value="25" name="PERF_PC_DS_INVOCATIONS"/>
+	<value value="26" name="PERF_PC_VS_INVOCATIONS"/>
+	<value value="27" name="PERF_PC_GS_INVOCATIONS"/>
+	<value value="28" name="PERF_PC_DS_PRIMITIVES"/>
+	<value value="29" name="PERF_PC_VPC_POS_DATA_TRANSACTION"/>
+	<value value="30" name="PERF_PC_3D_DRAWCALLS"/>
+	<value value="31" name="PERF_PC_2D_DRAWCALLS"/>
+	<value value="32" name="PERF_PC_NON_DRAWCALL_GLOBAL_EVENTS"/>
+	<value value="33" name="PERF_TESS_BUSY_CYCLES"/>
+	<value value="34" name="PERF_TESS_WORKING_CYCLES"/>
+	<value value="35" name="PERF_TESS_STALL_CYCLES_PC"/>
+	<value value="36" name="PERF_TESS_STARVE_CYCLES_PC"/>
+</enum>
+
+<enum name="a5xx_vfd_perfcounter_select">
+	<value value="0" name="PERF_VFD_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VFD_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="3" name="PERF_VFD_STALL_CYCLES_MISS_VB"/>
+	<value value="4" name="PERF_VFD_STALL_CYCLES_MISS_Q"/>
+	<value value="5" name="PERF_VFD_STALL_CYCLES_SP_INFO"/>
+	<value value="6" name="PERF_VFD_STALL_CYCLES_SP_ATTR"/>
+	<value value="7" name="PERF_VFD_STALL_CYCLES_VFDP_VB"/>
+	<value value="8" name="PERF_VFD_STALL_CYCLES_VFDP_Q"/>
+	<value value="9" name="PERF_VFD_DECODER_PACKER_STALL"/>
+	<value value="10" name="PERF_VFD_STARVE_CYCLES_UCHE"/>
+	<value value="11" name="PERF_VFD_RBUFFER_FULL"/>
+	<value value="12" name="PERF_VFD_ATTR_INFO_FIFO_FULL"/>
+	<value value="13" name="PERF_VFD_DECODED_ATTRIBUTE_BYTES"/>
+	<value value="14" name="PERF_VFD_NUM_ATTRIBUTES"/>
+	<value value="15" name="PERF_VFD_INSTRUCTIONS"/>
+	<value value="16" name="PERF_VFD_UPPER_SHADER_FIBERS"/>
+	<value value="17" name="PERF_VFD_LOWER_SHADER_FIBERS"/>
+	<value value="18" name="PERF_VFD_MODE_0_FIBERS"/>
+	<value value="19" name="PERF_VFD_MODE_1_FIBERS"/>
+	<value value="20" name="PERF_VFD_MODE_2_FIBERS"/>
+	<value value="21" name="PERF_VFD_MODE_3_FIBERS"/>
+	<value value="22" name="PERF_VFD_MODE_4_FIBERS"/>
+	<value value="23" name="PERF_VFD_TOTAL_VERTICES"/>
+	<value value="24" name="PERF_VFD_NUM_ATTR_MISS"/>
+	<value value="25" name="PERF_VFD_1_BURST_REQ"/>
+	<value value="26" name="PERF_VFDP_STALL_CYCLES_VFD"/>
+	<value value="27" name="PERF_VFDP_STALL_CYCLES_VFD_INDEX"/>
+	<value value="28" name="PERF_VFDP_STALL_CYCLES_VFD_PROG"/>
+	<value value="29" name="PERF_VFDP_STARVE_CYCLES_PC"/>
+	<value value="30" name="PERF_VFDP_VS_STAGE_32_WAVES"/>
+</enum>
+
+<enum name="a5xx_hlsq_perfcounter_select">
+	<value value="0" name="PERF_HLSQ_BUSY_CYCLES"/>
+	<value value="1" name="PERF_HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="3" name="PERF_HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="4" name="PERF_HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="5" name="PERF_HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="6" name="PERF_HLSQ_FS_STAGE_32_WAVES"/>
+	<value value="7" name="PERF_HLSQ_FS_STAGE_64_WAVES"/>
+	<value value="8" name="PERF_HLSQ_QUADS"/>
+	<value value="9" name="PERF_HLSQ_SP_STATE_COPY_TRANS_FS_STAGE"/>
+	<value value="10" name="PERF_HLSQ_SP_STATE_COPY_TRANS_VS_STAGE"/>
+	<value value="11" name="PERF_HLSQ_TP_STATE_COPY_TRANS_FS_STAGE"/>
+	<value value="12" name="PERF_HLSQ_TP_STATE_COPY_TRANS_VS_STAGE"/>
+	<value value="13" name="PERF_HLSQ_CS_INVOCATIONS"/>
+	<value value="14" name="PERF_HLSQ_COMPUTE_DRAWCALLS"/>
+</enum>
+
+<enum name="a5xx_vpc_perfcounter_select">
+	<value value="0" name="PERF_VPC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VPC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_VPC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="PERF_VPC_STALL_CYCLES_VFD_WACK"/>
+	<value value="4" name="PERF_VPC_STALL_CYCLES_HLSQ_PRIM_ALLOC"/>
+	<value value="5" name="PERF_VPC_STALL_CYCLES_PC"/>
+	<value value="6" name="PERF_VPC_STALL_CYCLES_SP_LM"/>
+	<value value="7" name="PERF_VPC_POS_EXPORT_STALL_CYCLES"/>
+	<value value="8" name="PERF_VPC_STARVE_CYCLES_SP"/>
+	<value value="9" name="PERF_VPC_STARVE_CYCLES_LRZ"/>
+	<value value="10" name="PERF_VPC_PC_PRIMITIVES"/>
+	<value value="11" name="PERF_VPC_SP_COMPONENTS"/>
+	<value value="12" name="PERF_VPC_SP_LM_PRIMITIVES"/>
+	<value value="13" name="PERF_VPC_SP_LM_COMPONENTS"/>
+	<value value="14" name="PERF_VPC_SP_LM_DWORDS"/>
+	<value value="15" name="PERF_VPC_STREAMOUT_COMPONENTS"/>
+	<value value="16" name="PERF_VPC_GRANT_PHASES"/>
+</enum>
+
+<enum name="a5xx_tse_perfcounter_select">
+	<value value="0" name="PERF_TSE_BUSY_CYCLES"/>
+	<value value="1" name="PERF_TSE_CLIPPING_CYCLES"/>
+	<value value="2" name="PERF_TSE_STALL_CYCLES_RAS"/>
+	<value value="3" name="PERF_TSE_STALL_CYCLES_LRZ_BARYPLANE"/>
+	<value value="4" name="PERF_TSE_STALL_CYCLES_LRZ_ZPLANE"/>
+	<value value="5" name="PERF_TSE_STARVE_CYCLES_PC"/>
+	<value value="6" name="PERF_TSE_INPUT_PRIM"/>
+	<value value="7" name="PERF_TSE_INPUT_NULL_PRIM"/>
+	<value value="8" name="PERF_TSE_TRIVAL_REJ_PRIM"/>
+	<value value="9" name="PERF_TSE_CLIPPED_PRIM"/>
+	<value value="10" name="PERF_TSE_ZERO_AREA_PRIM"/>
+	<value value="11" name="PERF_TSE_FACENESS_CULLED_PRIM"/>
+	<value value="12" name="PERF_TSE_ZERO_PIXEL_PRIM"/>
+	<value value="13" name="PERF_TSE_OUTPUT_NULL_PRIM"/>
+	<value value="14" name="PERF_TSE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="15" name="PERF_TSE_CINVOCATION"/>
+	<value value="16" name="PERF_TSE_CPRIMITIVES"/>
+	<value value="17" name="PERF_TSE_2D_INPUT_PRIM"/>
+	<value value="18" name="PERF_TSE_2D_ALIVE_CLCLES"/>
+</enum>
+
+<enum name="a5xx_ras_perfcounter_select">
+	<value value="0" name="PERF_RAS_BUSY_CYCLES"/>
+	<value value="1" name="PERF_RAS_SUPERTILE_ACTIVE_CYCLES"/>
+	<value value="2" name="PERF_RAS_STALL_CYCLES_LRZ"/>
+	<value value="3" name="PERF_RAS_STARVE_CYCLES_TSE"/>
+	<value value="4" name="PERF_RAS_SUPER_TILES"/>
+	<value value="5" name="PERF_RAS_8X4_TILES"/>
+	<value value="6" name="PERF_RAS_MASKGEN_ACTIVE"/>
+	<value value="7" name="PERF_RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="8" name="PERF_RAS_FULLY_COVERED_8X4_TILES"/>
+	<value value="9" name="PERF_RAS_PRIM_KILLED_INVISILBE"/>
+</enum>
+
+<enum name="a5xx_lrz_perfcounter_select">
+	<value value="0" name="PERF_LRZ_BUSY_CYCLES"/>
+	<value value="1" name="PERF_LRZ_STARVE_CYCLES_RAS"/>
+	<value value="2" name="PERF_LRZ_STALL_CYCLES_RB"/>
+	<value value="3" name="PERF_LRZ_STALL_CYCLES_VSC"/>
+	<value value="4" name="PERF_LRZ_STALL_CYCLES_VPC"/>
+	<value value="5" name="PERF_LRZ_STALL_CYCLES_FLAG_PREFETCH"/>
+	<value value="6" name="PERF_LRZ_STALL_CYCLES_UCHE"/>
+	<value value="7" name="PERF_LRZ_LRZ_READ"/>
+	<value value="8" name="PERF_LRZ_LRZ_WRITE"/>
+	<value value="9" name="PERF_LRZ_READ_LATENCY"/>
+	<value value="10" name="PERF_LRZ_MERGE_CACHE_UPDATING"/>
+	<value value="11" name="PERF_LRZ_PRIM_KILLED_BY_MASKGEN"/>
+	<value value="12" name="PERF_LRZ_PRIM_KILLED_BY_LRZ"/>
+	<value value="13" name="PERF_LRZ_VISIBLE_PRIM_AFTER_LRZ"/>
+	<value value="14" name="PERF_LRZ_FULL_8X8_TILES"/>
+	<value value="15" name="PERF_LRZ_PARTIAL_8X8_TILES"/>
+	<value value="16" name="PERF_LRZ_TILE_KILLED"/>
+	<value value="17" name="PERF_LRZ_TOTAL_PIXEL"/>
+	<value value="18" name="PERF_LRZ_VISIBLE_PIXEL_AFTER_LRZ"/>
+</enum>
+
+<enum name="a5xx_uche_perfcounter_select">
+	<value value="0" name="PERF_UCHE_BUSY_CYCLES"/>
+	<value value="1" name="PERF_UCHE_STALL_CYCLES_VBIF"/>
+	<value value="2" name="PERF_UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="3" name="PERF_UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="4" name="PERF_UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="5" name="PERF_UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="6" name="PERF_UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="7" name="PERF_UCHE_VBIF_READ_BEATS_LRZ"/>
+	<value value="8" name="PERF_UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="9" name="PERF_UCHE_READ_REQUESTS_TP"/>
+	<value value="10" name="PERF_UCHE_READ_REQUESTS_VFD"/>
+	<value value="11" name="PERF_UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="12" name="PERF_UCHE_READ_REQUESTS_LRZ"/>
+	<value value="13" name="PERF_UCHE_READ_REQUESTS_SP"/>
+	<value value="14" name="PERF_UCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="15" name="PERF_UCHE_WRITE_REQUESTS_SP"/>
+	<value value="16" name="PERF_UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="17" name="PERF_UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="18" name="PERF_UCHE_EVICTS"/>
+	<value value="19" name="PERF_UCHE_BANK_REQ0"/>
+	<value value="20" name="PERF_UCHE_BANK_REQ1"/>
+	<value value="21" name="PERF_UCHE_BANK_REQ2"/>
+	<value value="22" name="PERF_UCHE_BANK_REQ3"/>
+	<value value="23" name="PERF_UCHE_BANK_REQ4"/>
+	<value value="24" name="PERF_UCHE_BANK_REQ5"/>
+	<value value="25" name="PERF_UCHE_BANK_REQ6"/>
+	<value value="26" name="PERF_UCHE_BANK_REQ7"/>
+	<value value="27" name="PERF_UCHE_VBIF_READ_BEATS_CH0"/>
+	<value value="28" name="PERF_UCHE_VBIF_READ_BEATS_CH1"/>
+	<value value="29" name="PERF_UCHE_GMEM_READ_BEATS"/>
+	<value value="30" name="PERF_UCHE_FLAG_COUNT"/>
+</enum>
+
+<enum name="a5xx_tp_perfcounter_select">
+	<value value="0" name="PERF_TP_BUSY_CYCLES"/>
+	<value value="1" name="PERF_TP_STALL_CYCLES_UCHE"/>
+	<value value="2" name="PERF_TP_LATENCY_CYCLES"/>
+	<value value="3" name="PERF_TP_LATENCY_TRANS"/>
+	<value value="4" name="PERF_TP_FLAG_CACHE_REQUEST_SAMPLES"/>
+	<value value="5" name="PERF_TP_FLAG_CACHE_REQUEST_LATENCY"/>
+	<value value="6" name="PERF_TP_L1_CACHELINE_REQUESTS"/>
+	<value value="7" name="PERF_TP_L1_CACHELINE_MISSES"/>
+	<value value="8" name="PERF_TP_SP_TP_TRANS"/>
+	<value value="9" name="PERF_TP_TP_SP_TRANS"/>
+	<value value="10" name="PERF_TP_OUTPUT_PIXELS"/>
+	<value value="11" name="PERF_TP_FILTER_WORKLOAD_16BIT"/>
+	<value value="12" name="PERF_TP_FILTER_WORKLOAD_32BIT"/>
+	<value value="13" name="PERF_TP_QUADS_RECEIVED"/>
+	<value value="14" name="PERF_TP_QUADS_OFFSET"/>
+	<value value="15" name="PERF_TP_QUADS_SHADOW"/>
+	<value value="16" name="PERF_TP_QUADS_ARRAY"/>
+	<value value="17" name="PERF_TP_QUADS_GRADIENT"/>
+	<value value="18" name="PERF_TP_QUADS_1D"/>
+	<value value="19" name="PERF_TP_QUADS_2D"/>
+	<value value="20" name="PERF_TP_QUADS_BUFFER"/>
+	<value value="21" name="PERF_TP_QUADS_3D"/>
+	<value value="22" name="PERF_TP_QUADS_CUBE"/>
+	<value value="23" name="PERF_TP_STATE_CACHE_REQUESTS"/>
+	<value value="24" name="PERF_TP_STATE_CACHE_MISSES"/>
+	<value value="25" name="PERF_TP_DIVERGENT_QUADS_RECEIVED"/>
+	<value value="26" name="PERF_TP_BINDLESS_STATE_CACHE_REQUESTS"/>
+	<value value="27" name="PERF_TP_BINDLESS_STATE_CACHE_MISSES"/>
+	<value value="28" name="PERF_TP_PRT_NON_RESIDENT_EVENTS"/>
+	<value value="29" name="PERF_TP_OUTPUT_PIXELS_POINT"/>
+	<value value="30" name="PERF_TP_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="31" name="PERF_TP_OUTPUT_PIXELS_MIP"/>
+	<value value="32" name="PERF_TP_OUTPUT_PIXELS_ANISO"/>
+	<value value="33" name="PERF_TP_OUTPUT_PIXELS_ZERO_LOD"/>
+	<value value="34" name="PERF_TP_FLAG_CACHE_REQUESTS"/>
+	<value value="35" name="PERF_TP_FLAG_CACHE_MISSES"/>
+	<value value="36" name="PERF_TP_L1_5_L2_REQUESTS"/>
+	<value value="37" name="PERF_TP_2D_OUTPUT_PIXELS"/>
+	<value value="38" name="PERF_TP_2D_OUTPUT_PIXELS_POINT"/>
+	<value value="39" name="PERF_TP_2D_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="40" name="PERF_TP_2D_FILTER_WORKLOAD_16BIT"/>
+	<value value="41" name="PERF_TP_2D_FILTER_WORKLOAD_32BIT"/>
+</enum>
+
+<enum name="a5xx_sp_perfcounter_select">
+	<value value="0" name="PERF_SP_BUSY_CYCLES"/>
+	<value value="1" name="PERF_SP_ALU_WORKING_CYCLES"/>
+	<value value="2" name="PERF_SP_EFU_WORKING_CYCLES"/>
+	<value value="3" name="PERF_SP_STALL_CYCLES_VPC"/>
+	<value value="4" name="PERF_SP_STALL_CYCLES_TP"/>
+	<value value="5" name="PERF_SP_STALL_CYCLES_UCHE"/>
+	<value value="6" name="PERF_SP_STALL_CYCLES_RB"/>
+	<value value="7" name="PERF_SP_SCHEDULER_NON_WORKING"/>
+	<value value="8" name="PERF_SP_WAVE_CONTEXTS"/>
+	<value value="9" name="PERF_SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="10" name="PERF_SP_FS_STAGE_WAVE_CYCLES"/>
+	<value value="11" name="PERF_SP_FS_STAGE_WAVE_SAMPLES"/>
+	<value value="12" name="PERF_SP_VS_STAGE_WAVE_CYCLES"/>
+	<value value="13" name="PERF_SP_VS_STAGE_WAVE_SAMPLES"/>
+	<value value="14" name="PERF_SP_FS_STAGE_DURATION_CYCLES"/>
+	<value value="15" name="PERF_SP_VS_STAGE_DURATION_CYCLES"/>
+	<value value="16" name="PERF_SP_WAVE_CTRL_CYCLES"/>
+	<value value="17" name="PERF_SP_WAVE_LOAD_CYCLES"/>
+	<value value="18" name="PERF_SP_WAVE_EMIT_CYCLES"/>
+	<value value="19" name="PERF_SP_WAVE_NOP_CYCLES"/>
+	<value value="20" name="PERF_SP_WAVE_WAIT_CYCLES"/>
+	<value value="21" name="PERF_SP_WAVE_FETCH_CYCLES"/>
+	<value value="22" name="PERF_SP_WAVE_IDLE_CYCLES"/>
+	<value value="23" name="PERF_SP_WAVE_END_CYCLES"/>
+	<value value="24" name="PERF_SP_WAVE_LONG_SYNC_CYCLES"/>
+	<value value="25" name="PERF_SP_WAVE_SHORT_SYNC_CYCLES"/>
+	<value value="26" name="PERF_SP_WAVE_JOIN_CYCLES"/>
+	<value value="27" name="PERF_SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="28" name="PERF_SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="29" name="PERF_SP_LM_ATOMICS"/>
+	<value value="30" name="PERF_SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="31" name="PERF_SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="32" name="PERF_SP_GM_ATOMICS"/>
+	<value value="33" name="PERF_SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="34" name="PERF_SP_VS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="35" name="PERF_SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="36" name="PERF_SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="37" name="PERF_SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="38" name="PERF_SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="39" name="PERF_SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="40" name="PERF_SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="41" name="PERF_SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="42" name="PERF_SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="43" name="PERF_SP_FS_STAGE_BARY_INSTRUCTIONS"/>
+	<value value="44" name="PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="45" name="PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="46" name="PERF_SP_ADDR_LOCK_COUNT"/>
+	<value value="47" name="PERF_SP_UCHE_READ_TRANS"/>
+	<value value="48" name="PERF_SP_UCHE_WRITE_TRANS"/>
+	<value value="49" name="PERF_SP_EXPORT_VPC_TRANS"/>
+	<value value="50" name="PERF_SP_EXPORT_RB_TRANS"/>
+	<value value="51" name="PERF_SP_PIXELS_KILLED"/>
+	<value value="52" name="PERF_SP_ICL1_REQUESTS"/>
+	<value value="53" name="PERF_SP_ICL1_MISSES"/>
+	<value value="54" name="PERF_SP_ICL0_REQUESTS"/>
+	<value value="55" name="PERF_SP_ICL0_MISSES"/>
+	<value value="56" name="PERF_SP_HS_INSTRUCTIONS"/>
+	<value value="57" name="PERF_SP_DS_INSTRUCTIONS"/>
+	<value value="58" name="PERF_SP_GS_INSTRUCTIONS"/>
+	<value value="59" name="PERF_SP_CS_INSTRUCTIONS"/>
+	<value value="60" name="PERF_SP_GPR_READ"/>
+	<value value="61" name="PERF_SP_GPR_WRITE"/>
+	<value value="62" name="PERF_SP_LM_CH0_REQUESTS"/>
+	<value value="63" name="PERF_SP_LM_CH1_REQUESTS"/>
+	<value value="64" name="PERF_SP_LM_BANK_CONFLICTS"/>
+</enum>
+
+<enum name="a5xx_rb_perfcounter_select">
+	<value value="0" name="PERF_RB_BUSY_CYCLES"/>
+	<value value="1" name="PERF_RB_STALL_CYCLES_CCU"/>
+	<value value="2" name="PERF_RB_STALL_CYCLES_HLSQ"/>
+	<value value="3" name="PERF_RB_STALL_CYCLES_FIFO0_FULL"/>
+	<value value="4" name="PERF_RB_STALL_CYCLES_FIFO1_FULL"/>
+	<value value="5" name="PERF_RB_STALL_CYCLES_FIFO2_FULL"/>
+	<value value="6" name="PERF_RB_STARVE_CYCLES_SP"/>
+	<value value="7" name="PERF_RB_STARVE_CYCLES_LRZ_TILE"/>
+	<value value="8" name="PERF_RB_STARVE_CYCLES_CCU"/>
+	<value value="9" name="PERF_RB_STARVE_CYCLES_Z_PLANE"/>
+	<value value="10" name="PERF_RB_STARVE_CYCLES_BARY_PLANE"/>
+	<value value="11" name="PERF_RB_Z_WORKLOAD"/>
+	<value value="12" name="PERF_RB_HLSQ_ACTIVE"/>
+	<value value="13" name="PERF_RB_Z_READ"/>
+	<value value="14" name="PERF_RB_Z_WRITE"/>
+	<value value="15" name="PERF_RB_C_READ"/>
+	<value value="16" name="PERF_RB_C_WRITE"/>
+	<value value="17" name="PERF_RB_TOTAL_PASS"/>
+	<value value="18" name="PERF_RB_Z_PASS"/>
+	<value value="19" name="PERF_RB_Z_FAIL"/>
+	<value value="20" name="PERF_RB_S_FAIL"/>
+	<value value="21" name="PERF_RB_BLENDED_FXP_COMPONENTS"/>
+	<value value="22" name="PERF_RB_BLENDED_FP16_COMPONENTS"/>
+	<value value="23" name="RB_RESERVED"/>
+	<value value="24" name="PERF_RB_2D_ALIVE_CYCLES"/>
+	<value value="25" name="PERF_RB_2D_STALL_CYCLES_A2D"/>
+	<value value="26" name="PERF_RB_2D_STARVE_CYCLES_SRC"/>
+	<value value="27" name="PERF_RB_2D_STARVE_CYCLES_SP"/>
+	<value value="28" name="PERF_RB_2D_STARVE_CYCLES_DST"/>
+	<value value="29" name="PERF_RB_2D_VALID_PIXELS"/>
+</enum>
+
+<enum name="a5xx_rb_samples_perfcounter_select">
+	<value value="0" name="TOTAL_SAMPLES"/>
+	<value value="1" name="ZPASS_SAMPLES"/>
+	<value value="2" name="ZFAIL_SAMPLES"/>
+	<value value="3" name="SFAIL_SAMPLES"/>
+</enum>
+
+<enum name="a5xx_vsc_perfcounter_select">
+	<value value="0" name="PERF_VSC_BUSY_CYCLES"/>
+	<value value="1" name="PERF_VSC_WORKING_CYCLES"/>
+	<value value="2" name="PERF_VSC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="PERF_VSC_EOT_NUM"/>
+</enum>
+
+<enum name="a5xx_ccu_perfcounter_select">
+	<value value="0" name="PERF_CCU_BUSY_CYCLES"/>
+	<value value="1" name="PERF_CCU_STALL_CYCLES_RB_DEPTH_RETURN"/>
+	<value value="2" name="PERF_CCU_STALL_CYCLES_RB_COLOR_RETURN"/>
+	<value value="3" name="PERF_CCU_STARVE_CYCLES_FLAG_RETURN"/>
+	<value value="4" name="PERF_CCU_DEPTH_BLOCKS"/>
+	<value value="5" name="PERF_CCU_COLOR_BLOCKS"/>
+	<value value="6" name="PERF_CCU_DEPTH_BLOCK_HIT"/>
+	<value value="7" name="PERF_CCU_COLOR_BLOCK_HIT"/>
+	<value value="8" name="PERF_CCU_PARTIAL_BLOCK_READ"/>
+	<value value="9" name="PERF_CCU_GMEM_READ"/>
+	<value value="10" name="PERF_CCU_GMEM_WRITE"/>
+	<value value="11" name="PERF_CCU_DEPTH_READ_FLAG0_COUNT"/>
+	<value value="12" name="PERF_CCU_DEPTH_READ_FLAG1_COUNT"/>
+	<value value="13" name="PERF_CCU_DEPTH_READ_FLAG2_COUNT"/>
+	<value value="14" name="PERF_CCU_DEPTH_READ_FLAG3_COUNT"/>
+	<value value="15" name="PERF_CCU_DEPTH_READ_FLAG4_COUNT"/>
+	<value value="16" name="PERF_CCU_COLOR_READ_FLAG0_COUNT"/>
+	<value value="17" name="PERF_CCU_COLOR_READ_FLAG1_COUNT"/>
+	<value value="18" name="PERF_CCU_COLOR_READ_FLAG2_COUNT"/>
+	<value value="19" name="PERF_CCU_COLOR_READ_FLAG3_COUNT"/>
+	<value value="20" name="PERF_CCU_COLOR_READ_FLAG4_COUNT"/>
+	<value value="21" name="PERF_CCU_2D_BUSY_CYCLES"/>
+	<value value="22" name="PERF_CCU_2D_RD_REQ"/>
+	<value value="23" name="PERF_CCU_2D_WR_REQ"/>
+	<value value="24" name="PERF_CCU_2D_REORDER_STARVE_CYCLES"/>
+	<value value="25" name="PERF_CCU_2D_PIXELS"/>
+</enum>
+
+<enum name="a5xx_cmp_perfcounter_select">
+	<value value="0" name="PERF_CMPDECMP_STALL_CYCLES_VBIF"/>
+	<value value="1" name="PERF_CMPDECMP_VBIF_LATENCY_CYCLES"/>
+	<value value="2" name="PERF_CMPDECMP_VBIF_LATENCY_SAMPLES"/>
+	<value value="3" name="PERF_CMPDECMP_VBIF_READ_DATA_CCU"/>
+	<value value="4" name="PERF_CMPDECMP_VBIF_WRITE_DATA_CCU"/>
+	<value value="5" name="PERF_CMPDECMP_VBIF_READ_REQUEST"/>
+	<value value="6" name="PERF_CMPDECMP_VBIF_WRITE_REQUEST"/>
+	<value value="7" name="PERF_CMPDECMP_VBIF_READ_DATA"/>
+	<value value="8" name="PERF_CMPDECMP_VBIF_WRITE_DATA"/>
+	<value value="9" name="PERF_CMPDECMP_FLAG_FETCH_CYCLES"/>
+	<value value="10" name="PERF_CMPDECMP_FLAG_FETCH_SAMPLES"/>
+	<value value="11" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG1_COUNT"/>
+	<value value="12" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG2_COUNT"/>
+	<value value="13" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG3_COUNT"/>
+	<value value="14" name="PERF_CMPDECMP_DEPTH_WRITE_FLAG4_COUNT"/>
+	<value value="15" name="PERF_CMPDECMP_COLOR_WRITE_FLAG1_COUNT"/>
+	<value value="16" name="PERF_CMPDECMP_COLOR_WRITE_FLAG2_COUNT"/>
+	<value value="17" name="PERF_CMPDECMP_COLOR_WRITE_FLAG3_COUNT"/>
+	<value value="18" name="PERF_CMPDECMP_COLOR_WRITE_FLAG4_COUNT"/>
+	<value value="19" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_REQ"/>
+	<value value="20" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_WR"/>
+	<value value="21" name="PERF_CMPDECMP_2D_STALL_CYCLES_VBIF_RETURN"/>
+	<value value="22" name="PERF_CMPDECMP_2D_RD_DATA"/>
+	<value value="23" name="PERF_CMPDECMP_2D_WR_DATA"/>
+</enum>
+
+<enum name="a5xx_vbif_perfcounter_select">
+	<value value="0" name="AXI_READ_REQUESTS_ID_0"/>
+	<value value="1" name="AXI_READ_REQUESTS_ID_1"/>
+	<value value="2" name="AXI_READ_REQUESTS_ID_2"/>
+	<value value="3" name="AXI_READ_REQUESTS_ID_3"/>
+	<value value="4" name="AXI_READ_REQUESTS_ID_4"/>
+	<value value="5" name="AXI_READ_REQUESTS_ID_5"/>
+	<value value="6" name="AXI_READ_REQUESTS_ID_6"/>
+	<value value="7" name="AXI_READ_REQUESTS_ID_7"/>
+	<value value="8" name="AXI_READ_REQUESTS_ID_8"/>
+	<value value="9" name="AXI_READ_REQUESTS_ID_9"/>
+	<value value="10" name="AXI_READ_REQUESTS_ID_10"/>
+	<value value="11" name="AXI_READ_REQUESTS_ID_11"/>
+	<value value="12" name="AXI_READ_REQUESTS_ID_12"/>
+	<value value="13" name="AXI_READ_REQUESTS_ID_13"/>
+	<value value="14" name="AXI_READ_REQUESTS_ID_14"/>
+	<value value="15" name="AXI_READ_REQUESTS_ID_15"/>
+	<value value="16" name="AXI0_READ_REQUESTS_TOTAL"/>
+	<value value="17" name="AXI1_READ_REQUESTS_TOTAL"/>
+	<value value="18" name="AXI2_READ_REQUESTS_TOTAL"/>
+	<value value="19" name="AXI3_READ_REQUESTS_TOTAL"/>
+	<value value="20" name="AXI_READ_REQUESTS_TOTAL"/>
+	<value value="21" name="AXI_WRITE_REQUESTS_ID_0"/>
+	<value value="22" name="AXI_WRITE_REQUESTS_ID_1"/>
+	<value value="23" name="AXI_WRITE_REQUESTS_ID_2"/>
+	<value value="24" name="AXI_WRITE_REQUESTS_ID_3"/>
+	<value value="25" name="AXI_WRITE_REQUESTS_ID_4"/>
+	<value value="26" name="AXI_WRITE_REQUESTS_ID_5"/>
+	<value value="27" name="AXI_WRITE_REQUESTS_ID_6"/>
+	<value value="28" name="AXI_WRITE_REQUESTS_ID_7"/>
+	<value value="29" name="AXI_WRITE_REQUESTS_ID_8"/>
+	<value value="30" name="AXI_WRITE_REQUESTS_ID_9"/>
+	<value value="31" name="AXI_WRITE_REQUESTS_ID_10"/>
+	<value value="32" name="AXI_WRITE_REQUESTS_ID_11"/>
+	<value value="33" name="AXI_WRITE_REQUESTS_ID_12"/>
+	<value value="34" name="AXI_WRITE_REQUESTS_ID_13"/>
+	<value value="35" name="AXI_WRITE_REQUESTS_ID_14"/>
+	<value value="36" name="AXI_WRITE_REQUESTS_ID_15"/>
+	<value value="37" name="AXI0_WRITE_REQUESTS_TOTAL"/>
+	<value value="38" name="AXI1_WRITE_REQUESTS_TOTAL"/>
+	<value value="39" name="AXI2_WRITE_REQUESTS_TOTAL"/>
+	<value value="40" name="AXI3_WRITE_REQUESTS_TOTAL"/>
+	<value value="41" name="AXI_WRITE_REQUESTS_TOTAL"/>
+	<value value="42" name="AXI_TOTAL_REQUESTS"/>
+	<value value="43" name="AXI_READ_DATA_BEATS_ID_0"/>
+	<value value="44" name="AXI_READ_DATA_BEATS_ID_1"/>
+	<value value="45" name="AXI_READ_DATA_BEATS_ID_2"/>
+	<value value="46" name="AXI_READ_DATA_BEATS_ID_3"/>
+	<value value="47" name="AXI_READ_DATA_BEATS_ID_4"/>
+	<value value="48" name="AXI_READ_DATA_BEATS_ID_5"/>
+	<value value="49" name="AXI_READ_DATA_BEATS_ID_6"/>
+	<value value="50" name="AXI_READ_DATA_BEATS_ID_7"/>
+	<value value="51" name="AXI_READ_DATA_BEATS_ID_8"/>
+	<value value="52" name="AXI_READ_DATA_BEATS_ID_9"/>
+	<value value="53" name="AXI_READ_DATA_BEATS_ID_10"/>
+	<value value="54" name="AXI_READ_DATA_BEATS_ID_11"/>
+	<value value="55" name="AXI_READ_DATA_BEATS_ID_12"/>
+	<value value="56" name="AXI_READ_DATA_BEATS_ID_13"/>
+	<value value="57" name="AXI_READ_DATA_BEATS_ID_14"/>
+	<value value="58" name="AXI_READ_DATA_BEATS_ID_15"/>
+	<value value="59" name="AXI0_READ_DATA_BEATS_TOTAL"/>
+	<value value="60" name="AXI1_READ_DATA_BEATS_TOTAL"/>
+	<value value="61" name="AXI2_READ_DATA_BEATS_TOTAL"/>
+	<value value="62" name="AXI3_READ_DATA_BEATS_TOTAL"/>
+	<value value="63" name="AXI_READ_DATA_BEATS_TOTAL"/>
+	<value value="64" name="AXI_WRITE_DATA_BEATS_ID_0"/>
+	<value value="65" name="AXI_WRITE_DATA_BEATS_ID_1"/>
+	<value value="66" name="AXI_WRITE_DATA_BEATS_ID_2"/>
+	<value value="67" name="AXI_WRITE_DATA_BEATS_ID_3"/>
+	<value value="68" name="AXI_WRITE_DATA_BEATS_ID_4"/>
+	<value value="69" name="AXI_WRITE_DATA_BEATS_ID_5"/>
+	<value value="70" name="AXI_WRITE_DATA_BEATS_ID_6"/>
+	<value value="71" name="AXI_WRITE_DATA_BEATS_ID_7"/>
+	<value value="72" name="AXI_WRITE_DATA_BEATS_ID_8"/>
+	<value value="73" name="AXI_WRITE_DATA_BEATS_ID_9"/>
+	<value value="74" name="AXI_WRITE_DATA_BEATS_ID_10"/>
+	<value value="75" name="AXI_WRITE_DATA_BEATS_ID_11"/>
+	<value value="76" name="AXI_WRITE_DATA_BEATS_ID_12"/>
+	<value value="77" name="AXI_WRITE_DATA_BEATS_ID_13"/>
+	<value value="78" name="AXI_WRITE_DATA_BEATS_ID_14"/>
+	<value value="79" name="AXI_WRITE_DATA_BEATS_ID_15"/>
+	<value value="80" name="AXI0_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="81" name="AXI1_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="82" name="AXI2_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="83" name="AXI3_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="84" name="AXI_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="85" name="AXI_DATA_BEATS_TOTAL"/>
+</enum>
+
+<domain name="A5XX" width="32">
+	<bitset name="A5XX_INT0">
+		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
+		<bitfield name="RBBM_AHB_ERROR" pos="1" type="boolean"/>
+		<bitfield name="RBBM_TRANSFER_TIMEOUT" pos="2" type="boolean"/>
+		<bitfield name="RBBM_ME_MS_TIMEOUT" pos="3" type="boolean"/>
+		<bitfield name="RBBM_PFP_MS_TIMEOUT" pos="4" type="boolean"/>
+		<bitfield name="RBBM_ETS_MS_TIMEOUT" pos="5" type="boolean"/>
+		<bitfield name="RBBM_ATB_ASYNC_OVERFLOW" pos="6" type="boolean"/>
+		<bitfield name="RBBM_GPC_ERROR" pos="7" type="boolean"/>
+		<bitfield name="CP_SW" pos="8" type="boolean"/>
+		<bitfield name="CP_HW_ERROR" pos="9" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_DEPTH_TS" pos="10" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_COLOR_TS" pos="11" type="boolean"/>
+		<bitfield name="CP_CCU_RESOLVE_TS" pos="12" type="boolean"/>
+		<bitfield name="CP_IB2" pos="13" type="boolean"/>
+		<bitfield name="CP_IB1" pos="14" type="boolean"/>
+		<bitfield name="CP_RB" pos="15" type="boolean"/>
+		<bitfield name="CP_UNUSED_1" pos="16" type="boolean"/>
+		<bitfield name="CP_RB_DONE_TS" pos="17" type="boolean"/>
+		<bitfield name="CP_WT_DONE_TS" pos="18" type="boolean"/>
+		<bitfield name="UNKNOWN_1" pos="19" type="boolean"/>
+		<bitfield name="CP_CACHE_FLUSH_TS" pos="20" type="boolean"/>
+		<bitfield name="UNUSED_2" pos="21" type="boolean"/>
+		<bitfield name="RBBM_ATB_BUS_OVERFLOW" pos="22" type="boolean"/>
+		<bitfield name="MISC_HANG_DETECT" pos="23" type="boolean"/>
+		<bitfield name="UCHE_OOB_ACCESS" pos="24" type="boolean"/>
+		<bitfield name="UCHE_TRAP_INTR" pos="25" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
+		<bitfield name="GPMU_VOLTAGE_DROOP" pos="28" type="boolean"/>
+		<bitfield name="GPMU_FIRMWARE" pos="29" type="boolean"/>
+		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
+		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
+	</bitset>
+
+	<!-- CP Interrupt bits -->
+	<bitset name="A5XX_CP_INT">
+		<bitfield name="CP_OPCODE_ERROR" pos="0" type="boolean"/>
+		<bitfield name="CP_RESERVED_BIT_ERROR" pos="1" type="boolean"/>
+		<bitfield name="CP_HW_FAULT_ERROR" pos="2" type="boolean"/>
+		<bitfield name="CP_DMA_ERROR" pos="3" type="boolean"/>
+		<bitfield name="CP_REGISTER_PROTECTION_ERROR" pos="4" type="boolean"/>
+		<bitfield name="CP_AHB_ERROR" pos="5" type="boolean"/>
+	</bitset>
+
+	<!-- CP registers -->
+	<reg32 offset="0x0800" name="CP_RB_BASE"/>
+	<reg32 offset="0x0801" name="CP_RB_BASE_HI"/>
+	<reg32 offset="0x0802" name="CP_RB_CNTL"/>
+	<reg32 offset="0x0804" name="CP_RB_RPTR_ADDR"/>
+	<reg32 offset="0x0805" name="CP_RB_RPTR_ADDR_HI"/>
+	<reg32 offset="0x0806" name="CP_RB_RPTR"/>
+	<reg32 offset="0x0807" name="CP_RB_WPTR"/>
+	<reg32 offset="0x0808" name="CP_PFP_STAT_ADDR"/>
+	<reg32 offset="0x0809" name="CP_PFP_STAT_DATA"/>
+	<reg32 offset="0x080b" name="CP_DRAW_STATE_ADDR"/>
+	<reg32 offset="0x080c" name="CP_DRAW_STATE_DATA"/>
+	<reg32 offset="0x080d" name="CP_ME_NRT_ADDR_LO"/>
+	<reg32 offset="0x080e" name="CP_ME_NRT_ADDR_HI"/>
+	<reg32 offset="0x0810" name="CP_ME_NRT_DATA"/>
+	<reg32 offset="0x0817" name="CP_CRASH_SCRIPT_BASE_LO"/>
+	<reg32 offset="0x0818" name="CP_CRASH_SCRIPT_BASE_HI"/>
+	<reg32 offset="0x0819" name="CP_CRASH_DUMP_CNTL"/>
+	<reg32 offset="0x081a" name="CP_ME_STAT_ADDR"/>
+	<reg32 offset="0x081f" name="CP_ROQ_THRESHOLDS_1"/>
+	<reg32 offset="0x0820" name="CP_ROQ_THRESHOLDS_2"/>
+	<reg32 offset="0x0821" name="CP_ROQ_DBG_ADDR"/>
+	<reg32 offset="0x0822" name="CP_ROQ_DBG_DATA"/>
+	<reg32 offset="0x0823" name="CP_MEQ_DBG_ADDR"/>
+	<reg32 offset="0x0824" name="CP_MEQ_DBG_DATA"/>
+	<reg32 offset="0x0825" name="CP_MEQ_THRESHOLDS"/>
+	<reg32 offset="0x0826" name="CP_MERCIU_SIZE"/>
+	<reg32 offset="0x0827" name="CP_MERCIU_DBG_ADDR"/>
+	<reg32 offset="0x0828" name="CP_MERCIU_DBG_DATA_1"/>
+	<reg32 offset="0x0829" name="CP_MERCIU_DBG_DATA_2"/>
+	<reg32 offset="0x082a" name="CP_PFP_UCODE_DBG_ADDR"/>
+	<reg32 offset="0x082b" name="CP_PFP_UCODE_DBG_DATA"/>
+	<reg32 offset="0x082f" name="CP_ME_UCODE_DBG_ADDR"/>
+	<reg32 offset="0x0830" name="CP_ME_UCODE_DBG_DATA"/>
+	<reg32 offset="0x0831" name="CP_CNTL"/>
+	<reg32 offset="0x0832" name="CP_PFP_ME_CNTL"/>
+	<reg32 offset="0x0833" name="CP_CHICKEN_DBG"/>
+	<reg32 offset="0x0835" name="CP_PFP_INSTR_BASE_LO"/>
+	<reg32 offset="0x0836" name="CP_PFP_INSTR_BASE_HI"/>
+	<reg32 offset="0x0838" name="CP_ME_INSTR_BASE_LO"/>
+	<reg32 offset="0x0839" name="CP_ME_INSTR_BASE_HI"/>
+	<reg32 offset="0x083b" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x083c" name="CP_CONTEXT_SWITCH_RESTORE_ADDR_LO"/>
+	<reg32 offset="0x083d" name="CP_CONTEXT_SWITCH_RESTORE_ADDR_HI"/>
+	<reg32 offset="0x083e" name="CP_CONTEXT_SWITCH_SAVE_ADDR_LO"/>
+	<reg32 offset="0x083f" name="CP_CONTEXT_SWITCH_SAVE_ADDR_HI"/>
+	<reg32 offset="0x0840" name="CP_CONTEXT_SWITCH_SMMU_INFO_LO"/>
+	<reg32 offset="0x0841" name="CP_CONTEXT_SWITCH_SMMU_INFO_HI"/>
+	<reg32 offset="0x0860" name="CP_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0b14" name="CP_ME_STAT_DATA"/>
+	<reg32 offset="0x0b15" name="CP_WFI_PEND_CTR"/>
+	<reg32 offset="0x0b18" name="CP_INTERRUPT_STATUS"/>
+	<reg32 offset="0x0b1a" name="CP_HW_FAULT"/>
+	<reg32 offset="0x0b1c" name="CP_PROTECT_STATUS"/>
+	<reg32 offset="0x0b1f" name="CP_IB1_BASE"/>
+	<reg32 offset="0x0b20" name="CP_IB1_BASE_HI"/>
+	<reg32 offset="0x0b21" name="CP_IB1_BUFSZ"/>
+	<reg32 offset="0x0b22" name="CP_IB2_BASE"/>
+	<reg32 offset="0x0b23" name="CP_IB2_BASE_HI"/>
+	<reg32 offset="0x0b24" name="CP_IB2_BUFSZ"/>
+	<array offset="0x0b78" name="CP_SCRATCH" stride="1" length="8">
+		<reg32 offset="0x0" name="REG" type="uint"/>
+	</array>
+	<array offset="0x0880" name="CP_PROTECT" stride="1" length="32">
+		<reg32 offset="0x0" name="REG" type="adreno_cp_protect"/>
+	</array>
+	<reg32 offset="0x08a0" name="CP_PROTECT_CNTL"/>
+	<reg32 offset="0x0b1b" name="CP_AHB_FAULT"/>
+	<reg32 offset="0x0bb0" name="CP_PERFCTR_CP_SEL_0" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb1" name="CP_PERFCTR_CP_SEL_1" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb2" name="CP_PERFCTR_CP_SEL_2" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb3" name="CP_PERFCTR_CP_SEL_3" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb4" name="CP_PERFCTR_CP_SEL_4" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb5" name="CP_PERFCTR_CP_SEL_5" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb6" name="CP_PERFCTR_CP_SEL_6" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bb7" name="CP_PERFCTR_CP_SEL_7" type="a5xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0bc1" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0bba" name="CP_POWERCTR_CP_SEL_0"/>
+	<reg32 offset="0x0bbb" name="CP_POWERCTR_CP_SEL_1"/>
+	<reg32 offset="0x0bbc" name="CP_POWERCTR_CP_SEL_2"/>
+	<reg32 offset="0x0bbd" name="CP_POWERCTR_CP_SEL_3"/>
+
+	<!-- RBBM registers -->
+	<reg32 offset="0x0004" name="RBBM_CFG_DBGBUS_SEL_A"/>
+	<reg32 offset="0x0005" name="RBBM_CFG_DBGBUS_SEL_B"/>
+	<reg32 offset="0x0006" name="RBBM_CFG_DBGBUS_SEL_C"/>
+	<reg32 offset="0x0007" name="RBBM_CFG_DBGBUS_SEL_D"/>
+<!--
+#define A5XX_RBBM_CFG_DBGBUS_SEL_PING_INDEX_SHIFT    0x0
+#define A5XX_RBBM_CFG_DBGBUS_SEL_PING_BLK_SEL_SHIFT  0x8
+#define A5XX_RBBM_CFG_DBGBUS_SEL_PONG_INDEX_SHIFT    0x10
+#define A5XX_RBBM_CFG_DBGBUS_SEL_PONG_BLK_SEL_SHIFT  0x18
+ -->
+	<reg32 offset="0x0008" name="RBBM_CFG_DBGBUS_CNTLT"/>
+	<reg32 offset="0x0009" name="RBBM_CFG_DBGBUS_CNTLM"/>
+	<reg32 offset="0x0018" name="RBBM_CFG_DEBBUS_CTLTM_ENABLE_SHIFT"/>
+	<reg32 offset="0x000a" name="RBBM_CFG_DBGBUS_OPL"/>
+	<reg32 offset="0x000b" name="RBBM_CFG_DBGBUS_OPE"/>
+	<reg32 offset="0x000c" name="RBBM_CFG_DBGBUS_IVTL_0"/>
+	<reg32 offset="0x000d" name="RBBM_CFG_DBGBUS_IVTL_1"/>
+	<reg32 offset="0x000e" name="RBBM_CFG_DBGBUS_IVTL_2"/>
+	<reg32 offset="0x000f" name="RBBM_CFG_DBGBUS_IVTL_3"/>
+	<reg32 offset="0x0010" name="RBBM_CFG_DBGBUS_MASKL_0"/>
+	<reg32 offset="0x0011" name="RBBM_CFG_DBGBUS_MASKL_1"/>
+	<reg32 offset="0x0012" name="RBBM_CFG_DBGBUS_MASKL_2"/>
+	<reg32 offset="0x0013" name="RBBM_CFG_DBGBUS_MASKL_3"/>
+	<reg32 offset="0x0014" name="RBBM_CFG_DBGBUS_BYTEL_0"/>
+	<reg32 offset="0x0015" name="RBBM_CFG_DBGBUS_BYTEL_1"/>
+	<reg32 offset="0x0016" name="RBBM_CFG_DBGBUS_IVTE_0"/>
+	<reg32 offset="0x0017" name="RBBM_CFG_DBGBUS_IVTE_1"/>
+	<reg32 offset="0x0018" name="RBBM_CFG_DBGBUS_IVTE_2"/>
+	<reg32 offset="0x0019" name="RBBM_CFG_DBGBUS_IVTE_3"/>
+	<reg32 offset="0x001a" name="RBBM_CFG_DBGBUS_MASKE_0"/>
+	<reg32 offset="0x001b" name="RBBM_CFG_DBGBUS_MASKE_1"/>
+	<reg32 offset="0x001c" name="RBBM_CFG_DBGBUS_MASKE_2"/>
+	<reg32 offset="0x001d" name="RBBM_CFG_DBGBUS_MASKE_3"/>
+	<reg32 offset="0x001e" name="RBBM_CFG_DBGBUS_NIBBLEE"/>
+	<reg32 offset="0x001f" name="RBBM_CFG_DBGBUS_PTRC0"/>
+	<reg32 offset="0x0020" name="RBBM_CFG_DBGBUS_PTRC1"/>
+	<reg32 offset="0x0021" name="RBBM_CFG_DBGBUS_LOADREG"/>
+	<reg32 offset="0x0022" name="RBBM_CFG_DBGBUS_IDX"/>
+	<reg32 offset="0x0023" name="RBBM_CFG_DBGBUS_CLRC"/>
+	<reg32 offset="0x0024" name="RBBM_CFG_DBGBUS_LOADIVT"/>
+	<reg32 offset="0x002f" name="RBBM_INTERFACE_HANG_INT_CNTL"/>
+	<reg32 offset="0x0037" name="RBBM_INT_CLEAR_CMD"/>
+	<reg32 offset="0x0038" name="RBBM_INT_0_MASK">
+		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
+		<bitfield name="RBBM_AHB_ERROR" pos="1" type="boolean"/>
+		<bitfield name="RBBM_TRANSFER_TIMEOUT" pos="2" type="boolean"/>
+		<bitfield name="RBBM_ME_MS_TIMEOUT" pos="3" type="boolean"/>
+		<bitfield name="RBBM_PFP_MS_TIMEOUT" pos="4" type="boolean"/>
+		<bitfield name="RBBM_ETS_MS_TIMEOUT" pos="5" type="boolean"/>
+		<bitfield name="RBBM_ATB_ASYNC_OVERFLOW" pos="6" type="boolean"/>
+		<bitfield name="RBBM_GPC_ERROR" pos="7" type="boolean"/>
+		<bitfield name="CP_SW" pos="8" type="boolean"/>
+		<bitfield name="CP_HW_ERROR" pos="9" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_DEPTH_TS" pos="10" type="boolean"/>
+		<bitfield name="CP_CCU_FLUSH_COLOR_TS" pos="11" type="boolean"/>
+		<bitfield name="CP_CCU_RESOLVE_TS" pos="12" type="boolean"/>
+		<bitfield name="CP_IB2" pos="13" type="boolean"/>
+		<bitfield name="CP_IB1" pos="14" type="boolean"/>
+		<bitfield name="CP_RB" pos="15" type="boolean"/>
+		<bitfield name="CP_RB_DONE_TS" pos="17" type="boolean"/>
+		<bitfield name="CP_WT_DONE_TS" pos="18" type="boolean"/>
+		<bitfield name="CP_CACHE_FLUSH_TS" pos="20" type="boolean"/>
+		<bitfield name="RBBM_ATB_BUS_OVERFLOW" pos="22" type="boolean"/>
+		<bitfield name="MISC_HANG_DETECT" pos="23" type="boolean"/>
+		<bitfield name="UCHE_OOB_ACCESS" pos="24" type="boolean"/>
+		<bitfield name="UCHE_TRAP_INTR" pos="25" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
+		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
+		<bitfield name="GPMU_VOLTAGE_DROOP" pos="28" type="boolean"/>
+		<bitfield name="GPMU_FIRMWARE" pos="29" type="boolean"/>
+		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
+		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x003f" name="RBBM_AHB_DBG_CNTL"/>
+	<reg32 offset="0x0041" name="RBBM_EXT_VBIF_DBG_CNTL"/>
+	<reg32 offset="0x0043" name="RBBM_SW_RESET_CMD"/>
+	<reg32 offset="0x0045" name="RBBM_BLOCK_SW_RESET_CMD"/>
+	<reg32 offset="0x0046" name="RBBM_BLOCK_SW_RESET_CMD2"/>
+	<reg32 offset="0x0048" name="RBBM_DBG_LO_HI_GPIO"/>
+	<reg32 offset="0x0049" name="RBBM_EXT_TRACE_BUS_CNTL"/>
+	<reg32 offset="0x004a" name="RBBM_CLOCK_CNTL_TP0"/>
+	<reg32 offset="0x004b" name="RBBM_CLOCK_CNTL_TP1"/>
+	<reg32 offset="0x004c" name="RBBM_CLOCK_CNTL_TP2"/>
+	<reg32 offset="0x004d" name="RBBM_CLOCK_CNTL_TP3"/>
+	<reg32 offset="0x004e" name="RBBM_CLOCK_CNTL2_TP0"/>
+	<reg32 offset="0x004f" name="RBBM_CLOCK_CNTL2_TP1"/>
+	<reg32 offset="0x0050" name="RBBM_CLOCK_CNTL2_TP2"/>
+	<reg32 offset="0x0051" name="RBBM_CLOCK_CNTL2_TP3"/>
+	<reg32 offset="0x0052" name="RBBM_CLOCK_CNTL3_TP0"/>
+	<reg32 offset="0x0053" name="RBBM_CLOCK_CNTL3_TP1"/>
+	<reg32 offset="0x0054" name="RBBM_CLOCK_CNTL3_TP2"/>
+	<reg32 offset="0x0055" name="RBBM_CLOCK_CNTL3_TP3"/>
+	<reg32 offset="0x0059" name="RBBM_READ_AHB_THROUGH_DBG"/>
+	<reg32 offset="0x005a" name="RBBM_CLOCK_CNTL_UCHE"/>
+	<reg32 offset="0x005b" name="RBBM_CLOCK_CNTL2_UCHE"/>
+	<reg32 offset="0x005c" name="RBBM_CLOCK_CNTL3_UCHE"/>
+	<reg32 offset="0x005d" name="RBBM_CLOCK_CNTL4_UCHE"/>
+	<reg32 offset="0x005e" name="RBBM_CLOCK_HYST_UCHE"/>
+	<reg32 offset="0x005f" name="RBBM_CLOCK_DELAY_UCHE"/>
+	<reg32 offset="0x0060" name="RBBM_CLOCK_MODE_GPC"/>
+	<reg32 offset="0x0061" name="RBBM_CLOCK_DELAY_GPC"/>
+	<reg32 offset="0x0062" name="RBBM_CLOCK_HYST_GPC"/>
+	<reg32 offset="0x0063" name="RBBM_CLOCK_CNTL_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0064" name="RBBM_CLOCK_HYST_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0065" name="RBBM_CLOCK_DELAY_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0066" name="RBBM_CLOCK_DELAY_HLSQ"/>
+	<reg32 offset="0x0067" name="RBBM_CLOCK_CNTL"/>
+	<reg32 offset="0x0068" name="RBBM_CLOCK_CNTL_SP0"/>
+	<reg32 offset="0x0069" name="RBBM_CLOCK_CNTL_SP1"/>
+	<reg32 offset="0x006a" name="RBBM_CLOCK_CNTL_SP2"/>
+	<reg32 offset="0x006b" name="RBBM_CLOCK_CNTL_SP3"/>
+	<reg32 offset="0x006c" name="RBBM_CLOCK_CNTL2_SP0"/>
+	<reg32 offset="0x006d" name="RBBM_CLOCK_CNTL2_SP1"/>
+	<reg32 offset="0x006e" name="RBBM_CLOCK_CNTL2_SP2"/>
+	<reg32 offset="0x006f" name="RBBM_CLOCK_CNTL2_SP3"/>
+	<reg32 offset="0x0070" name="RBBM_CLOCK_HYST_SP0"/>
+	<reg32 offset="0x0071" name="RBBM_CLOCK_HYST_SP1"/>
+	<reg32 offset="0x0072" name="RBBM_CLOCK_HYST_SP2"/>
+	<reg32 offset="0x0073" name="RBBM_CLOCK_HYST_SP3"/>
+	<reg32 offset="0x0074" name="RBBM_CLOCK_DELAY_SP0"/>
+	<reg32 offset="0x0075" name="RBBM_CLOCK_DELAY_SP1"/>
+	<reg32 offset="0x0076" name="RBBM_CLOCK_DELAY_SP2"/>
+	<reg32 offset="0x0077" name="RBBM_CLOCK_DELAY_SP3"/>
+	<reg32 offset="0x0078" name="RBBM_CLOCK_CNTL_RB0"/>
+	<reg32 offset="0x0079" name="RBBM_CLOCK_CNTL_RB1"/>
+	<reg32 offset="0x007a" name="RBBM_CLOCK_CNTL_RB2"/>
+	<reg32 offset="0x007b" name="RBBM_CLOCK_CNTL_RB3"/>
+	<reg32 offset="0x007c" name="RBBM_CLOCK_CNTL2_RB0"/>
+	<reg32 offset="0x007d" name="RBBM_CLOCK_CNTL2_RB1"/>
+	<reg32 offset="0x007e" name="RBBM_CLOCK_CNTL2_RB2"/>
+	<reg32 offset="0x007f" name="RBBM_CLOCK_CNTL2_RB3"/>
+	<reg32 offset="0x0080" name="RBBM_CLOCK_HYST_RAC"/>
+	<reg32 offset="0x0081" name="RBBM_CLOCK_DELAY_RAC"/>
+	<reg32 offset="0x0082" name="RBBM_CLOCK_CNTL_CCU0"/>
+	<reg32 offset="0x0083" name="RBBM_CLOCK_CNTL_CCU1"/>
+	<reg32 offset="0x0084" name="RBBM_CLOCK_CNTL_CCU2"/>
+	<reg32 offset="0x0085" name="RBBM_CLOCK_CNTL_CCU3"/>
+	<reg32 offset="0x0086" name="RBBM_CLOCK_HYST_RB_CCU0"/>
+	<reg32 offset="0x0087" name="RBBM_CLOCK_HYST_RB_CCU1"/>
+	<reg32 offset="0x0088" name="RBBM_CLOCK_HYST_RB_CCU2"/>
+	<reg32 offset="0x0089" name="RBBM_CLOCK_HYST_RB_CCU3"/>
+	<reg32 offset="0x008a" name="RBBM_CLOCK_CNTL_RAC"/>
+	<reg32 offset="0x008b" name="RBBM_CLOCK_CNTL2_RAC"/>
+	<reg32 offset="0x008c" name="RBBM_CLOCK_DELAY_RB_CCU_L1_0"/>
+	<reg32 offset="0x008d" name="RBBM_CLOCK_DELAY_RB_CCU_L1_1"/>
+	<reg32 offset="0x008e" name="RBBM_CLOCK_DELAY_RB_CCU_L1_2"/>
+	<reg32 offset="0x008f" name="RBBM_CLOCK_DELAY_RB_CCU_L1_3"/>
+	<reg32 offset="0x0090" name="RBBM_CLOCK_HYST_VFD"/>
+	<reg32 offset="0x0091" name="RBBM_CLOCK_MODE_VFD"/>
+	<reg32 offset="0x0092" name="RBBM_CLOCK_DELAY_VFD"/>
+	<reg32 offset="0x0093" name="RBBM_AHB_CNTL0"/>
+	<reg32 offset="0x0094" name="RBBM_AHB_CNTL1"/>
+	<reg32 offset="0x0095" name="RBBM_AHB_CNTL2"/>
+	<reg32 offset="0x0096" name="RBBM_AHB_CMD"/>
+	<reg32 offset="0x009c" name="RBBM_INTERFACE_HANG_MASK_CNTL11"/>
+	<reg32 offset="0x009d" name="RBBM_INTERFACE_HANG_MASK_CNTL12"/>
+	<reg32 offset="0x009e" name="RBBM_INTERFACE_HANG_MASK_CNTL13"/>
+	<reg32 offset="0x009f" name="RBBM_INTERFACE_HANG_MASK_CNTL14"/>
+	<reg32 offset="0x00a0" name="RBBM_INTERFACE_HANG_MASK_CNTL15"/>
+	<reg32 offset="0x00a1" name="RBBM_INTERFACE_HANG_MASK_CNTL16"/>
+	<reg32 offset="0x00a2" name="RBBM_INTERFACE_HANG_MASK_CNTL17"/>
+	<reg32 offset="0x00a3" name="RBBM_INTERFACE_HANG_MASK_CNTL18"/>
+	<reg32 offset="0x00a4" name="RBBM_CLOCK_DELAY_TP0"/>
+	<reg32 offset="0x00a5" name="RBBM_CLOCK_DELAY_TP1"/>
+	<reg32 offset="0x00a6" name="RBBM_CLOCK_DELAY_TP2"/>
+	<reg32 offset="0x00a7" name="RBBM_CLOCK_DELAY_TP3"/>
+	<reg32 offset="0x00a8" name="RBBM_CLOCK_DELAY2_TP0"/>
+	<reg32 offset="0x00a9" name="RBBM_CLOCK_DELAY2_TP1"/>
+	<reg32 offset="0x00aa" name="RBBM_CLOCK_DELAY2_TP2"/>
+	<reg32 offset="0x00ab" name="RBBM_CLOCK_DELAY2_TP3"/>
+	<reg32 offset="0x00ac" name="RBBM_CLOCK_DELAY3_TP0"/>
+	<reg32 offset="0x00ad" name="RBBM_CLOCK_DELAY3_TP1"/>
+	<reg32 offset="0x00ae" name="RBBM_CLOCK_DELAY3_TP2"/>
+	<reg32 offset="0x00af" name="RBBM_CLOCK_DELAY3_TP3"/>
+	<reg32 offset="0x00b0" name="RBBM_CLOCK_HYST_TP0"/>
+	<reg32 offset="0x00b1" name="RBBM_CLOCK_HYST_TP1"/>
+	<reg32 offset="0x00b2" name="RBBM_CLOCK_HYST_TP2"/>
+	<reg32 offset="0x00b3" name="RBBM_CLOCK_HYST_TP3"/>
+	<reg32 offset="0x00b4" name="RBBM_CLOCK_HYST2_TP0"/>
+	<reg32 offset="0x00b5" name="RBBM_CLOCK_HYST2_TP1"/>
+	<reg32 offset="0x00b6" name="RBBM_CLOCK_HYST2_TP2"/>
+	<reg32 offset="0x00b7" name="RBBM_CLOCK_HYST2_TP3"/>
+	<reg32 offset="0x00b8" name="RBBM_CLOCK_HYST3_TP0"/>
+	<reg32 offset="0x00b9" name="RBBM_CLOCK_HYST3_TP1"/>
+	<reg32 offset="0x00ba" name="RBBM_CLOCK_HYST3_TP2"/>
+	<reg32 offset="0x00bb" name="RBBM_CLOCK_HYST3_TP3"/>
+	<reg32 offset="0x00c8" name="RBBM_CLOCK_CNTL_GPMU"/>
+	<reg32 offset="0x00c9" name="RBBM_CLOCK_DELAY_GPMU"/>
+	<reg32 offset="0x00ca" name="RBBM_CLOCK_HYST_GPMU"/>
+	<reg32 offset="0x03a0" name="RBBM_PERFCTR_CP_0_LO"/>
+	<reg32 offset="0x03a1" name="RBBM_PERFCTR_CP_0_HI"/>
+	<reg32 offset="0x03a2" name="RBBM_PERFCTR_CP_1_LO"/>
+	<reg32 offset="0x03a3" name="RBBM_PERFCTR_CP_1_HI"/>
+	<reg32 offset="0x03a4" name="RBBM_PERFCTR_CP_2_LO"/>
+	<reg32 offset="0x03a5" name="RBBM_PERFCTR_CP_2_HI"/>
+	<reg32 offset="0x03a6" name="RBBM_PERFCTR_CP_3_LO"/>
+	<reg32 offset="0x03a7" name="RBBM_PERFCTR_CP_3_HI"/>
+	<reg32 offset="0x03a8" name="RBBM_PERFCTR_CP_4_LO"/>
+	<reg32 offset="0x03a9" name="RBBM_PERFCTR_CP_4_HI"/>
+	<reg32 offset="0x03aa" name="RBBM_PERFCTR_CP_5_LO"/>
+	<reg32 offset="0x03ab" name="RBBM_PERFCTR_CP_5_HI"/>
+	<reg32 offset="0x03ac" name="RBBM_PERFCTR_CP_6_LO"/>
+	<reg32 offset="0x03ad" name="RBBM_PERFCTR_CP_6_HI"/>
+	<reg32 offset="0x03ae" name="RBBM_PERFCTR_CP_7_LO"/>
+	<reg32 offset="0x03af" name="RBBM_PERFCTR_CP_7_HI"/>
+	<reg32 offset="0x03b0" name="RBBM_PERFCTR_RBBM_0_LO"/>
+	<reg32 offset="0x03b1" name="RBBM_PERFCTR_RBBM_0_HI"/>
+	<reg32 offset="0x03b2" name="RBBM_PERFCTR_RBBM_1_LO"/>
+	<reg32 offset="0x03b3" name="RBBM_PERFCTR_RBBM_1_HI"/>
+	<reg32 offset="0x03b4" name="RBBM_PERFCTR_RBBM_2_LO"/>
+	<reg32 offset="0x03b5" name="RBBM_PERFCTR_RBBM_2_HI"/>
+	<reg32 offset="0x03b6" name="RBBM_PERFCTR_RBBM_3_LO"/>
+	<reg32 offset="0x03b7" name="RBBM_PERFCTR_RBBM_3_HI"/>
+	<reg32 offset="0x03b8" name="RBBM_PERFCTR_PC_0_LO"/>
+	<reg32 offset="0x03b9" name="RBBM_PERFCTR_PC_0_HI"/>
+	<reg32 offset="0x03ba" name="RBBM_PERFCTR_PC_1_LO"/>
+	<reg32 offset="0x03bb" name="RBBM_PERFCTR_PC_1_HI"/>
+	<reg32 offset="0x03bc" name="RBBM_PERFCTR_PC_2_LO"/>
+	<reg32 offset="0x03bd" name="RBBM_PERFCTR_PC_2_HI"/>
+	<reg32 offset="0x03be" name="RBBM_PERFCTR_PC_3_LO"/>
+	<reg32 offset="0x03bf" name="RBBM_PERFCTR_PC_3_HI"/>
+	<reg32 offset="0x03c0" name="RBBM_PERFCTR_PC_4_LO"/>
+	<reg32 offset="0x03c1" name="RBBM_PERFCTR_PC_4_HI"/>
+	<reg32 offset="0x03c2" name="RBBM_PERFCTR_PC_5_LO"/>
+	<reg32 offset="0x03c3" name="RBBM_PERFCTR_PC_5_HI"/>
+	<reg32 offset="0x03c4" name="RBBM_PERFCTR_PC_6_LO"/>
+	<reg32 offset="0x03c5" name="RBBM_PERFCTR_PC_6_HI"/>
+	<reg32 offset="0x03c6" name="RBBM_PERFCTR_PC_7_LO"/>
+	<reg32 offset="0x03c7" name="RBBM_PERFCTR_PC_7_HI"/>
+	<reg32 offset="0x03c8" name="RBBM_PERFCTR_VFD_0_LO"/>
+	<reg32 offset="0x03c9" name="RBBM_PERFCTR_VFD_0_HI"/>
+	<reg32 offset="0x03ca" name="RBBM_PERFCTR_VFD_1_LO"/>
+	<reg32 offset="0x03cb" name="RBBM_PERFCTR_VFD_1_HI"/>
+	<reg32 offset="0x03cc" name="RBBM_PERFCTR_VFD_2_LO"/>
+	<reg32 offset="0x03cd" name="RBBM_PERFCTR_VFD_2_HI"/>
+	<reg32 offset="0x03ce" name="RBBM_PERFCTR_VFD_3_LO"/>
+	<reg32 offset="0x03cf" name="RBBM_PERFCTR_VFD_3_HI"/>
+	<reg32 offset="0x03d0" name="RBBM_PERFCTR_VFD_4_LO"/>
+	<reg32 offset="0x03d1" name="RBBM_PERFCTR_VFD_4_HI"/>
+	<reg32 offset="0x03d2" name="RBBM_PERFCTR_VFD_5_LO"/>
+	<reg32 offset="0x03d3" name="RBBM_PERFCTR_VFD_5_HI"/>
+	<reg32 offset="0x03d4" name="RBBM_PERFCTR_VFD_6_LO"/>
+	<reg32 offset="0x03d5" name="RBBM_PERFCTR_VFD_6_HI"/>
+	<reg32 offset="0x03d6" name="RBBM_PERFCTR_VFD_7_LO"/>
+	<reg32 offset="0x03d7" name="RBBM_PERFCTR_VFD_7_HI"/>
+	<reg32 offset="0x03d8" name="RBBM_PERFCTR_HLSQ_0_LO"/>
+	<reg32 offset="0x03d9" name="RBBM_PERFCTR_HLSQ_0_HI"/>
+	<reg32 offset="0x03da" name="RBBM_PERFCTR_HLSQ_1_LO"/>
+	<reg32 offset="0x03db" name="RBBM_PERFCTR_HLSQ_1_HI"/>
+	<reg32 offset="0x03dc" name="RBBM_PERFCTR_HLSQ_2_LO"/>
+	<reg32 offset="0x03dd" name="RBBM_PERFCTR_HLSQ_2_HI"/>
+	<reg32 offset="0x03de" name="RBBM_PERFCTR_HLSQ_3_LO"/>
+	<reg32 offset="0x03df" name="RBBM_PERFCTR_HLSQ_3_HI"/>
+	<reg32 offset="0x03e0" name="RBBM_PERFCTR_HLSQ_4_LO"/>
+	<reg32 offset="0x03e1" name="RBBM_PERFCTR_HLSQ_4_HI"/>
+	<reg32 offset="0x03e2" name="RBBM_PERFCTR_HLSQ_5_LO"/>
+	<reg32 offset="0x03e3" name="RBBM_PERFCTR_HLSQ_5_HI"/>
+	<reg32 offset="0x03e4" name="RBBM_PERFCTR_HLSQ_6_LO"/>
+	<reg32 offset="0x03e5" name="RBBM_PERFCTR_HLSQ_6_HI"/>
+	<reg32 offset="0x03e6" name="RBBM_PERFCTR_HLSQ_7_LO"/>
+	<reg32 offset="0x03e7" name="RBBM_PERFCTR_HLSQ_7_HI"/>
+	<reg32 offset="0x03e8" name="RBBM_PERFCTR_VPC_0_LO"/>
+	<reg32 offset="0x03e9" name="RBBM_PERFCTR_VPC_0_HI"/>
+	<reg32 offset="0x03ea" name="RBBM_PERFCTR_VPC_1_LO"/>
+	<reg32 offset="0x03eb" name="RBBM_PERFCTR_VPC_1_HI"/>
+	<reg32 offset="0x03ec" name="RBBM_PERFCTR_VPC_2_LO"/>
+	<reg32 offset="0x03ed" name="RBBM_PERFCTR_VPC_2_HI"/>
+	<reg32 offset="0x03ee" name="RBBM_PERFCTR_VPC_3_LO"/>
+	<reg32 offset="0x03ef" name="RBBM_PERFCTR_VPC_3_HI"/>
+	<reg32 offset="0x03f0" name="RBBM_PERFCTR_CCU_0_LO"/>
+	<reg32 offset="0x03f1" name="RBBM_PERFCTR_CCU_0_HI"/>
+	<reg32 offset="0x03f2" name="RBBM_PERFCTR_CCU_1_LO"/>
+	<reg32 offset="0x03f3" name="RBBM_PERFCTR_CCU_1_HI"/>
+	<reg32 offset="0x03f4" name="RBBM_PERFCTR_CCU_2_LO"/>
+	<reg32 offset="0x03f5" name="RBBM_PERFCTR_CCU_2_HI"/>
+	<reg32 offset="0x03f6" name="RBBM_PERFCTR_CCU_3_LO"/>
+	<reg32 offset="0x03f7" name="RBBM_PERFCTR_CCU_3_HI"/>
+	<reg32 offset="0x03f8" name="RBBM_PERFCTR_TSE_0_LO"/>
+	<reg32 offset="0x03f9" name="RBBM_PERFCTR_TSE_0_HI"/>
+	<reg32 offset="0x03fa" name="RBBM_PERFCTR_TSE_1_LO"/>
+	<reg32 offset="0x03fb" name="RBBM_PERFCTR_TSE_1_HI"/>
+	<reg32 offset="0x03fc" name="RBBM_PERFCTR_TSE_2_LO"/>
+	<reg32 offset="0x03fd" name="RBBM_PERFCTR_TSE_2_HI"/>
+	<reg32 offset="0x03fe" name="RBBM_PERFCTR_TSE_3_LO"/>
+	<reg32 offset="0x03ff" name="RBBM_PERFCTR_TSE_3_HI"/>
+	<reg32 offset="0x0400" name="RBBM_PERFCTR_RAS_0_LO"/>
+	<reg32 offset="0x0401" name="RBBM_PERFCTR_RAS_0_HI"/>
+	<reg32 offset="0x0402" name="RBBM_PERFCTR_RAS_1_LO"/>
+	<reg32 offset="0x0403" name="RBBM_PERFCTR_RAS_1_HI"/>
+	<reg32 offset="0x0404" name="RBBM_PERFCTR_RAS_2_LO"/>
+	<reg32 offset="0x0405" name="RBBM_PERFCTR_RAS_2_HI"/>
+	<reg32 offset="0x0406" name="RBBM_PERFCTR_RAS_3_LO"/>
+	<reg32 offset="0x0407" name="RBBM_PERFCTR_RAS_3_HI"/>
+	<reg32 offset="0x0408" name="RBBM_PERFCTR_UCHE_0_LO"/>
+	<reg32 offset="0x0409" name="RBBM_PERFCTR_UCHE_0_HI"/>
+	<reg32 offset="0x040a" name="RBBM_PERFCTR_UCHE_1_LO"/>
+	<reg32 offset="0x040b" name="RBBM_PERFCTR_UCHE_1_HI"/>
+	<reg32 offset="0x040c" name="RBBM_PERFCTR_UCHE_2_LO"/>
+	<reg32 offset="0x040d" name="RBBM_PERFCTR_UCHE_2_HI"/>
+	<reg32 offset="0x040e" name="RBBM_PERFCTR_UCHE_3_LO"/>
+	<reg32 offset="0x040f" name="RBBM_PERFCTR_UCHE_3_HI"/>
+	<reg32 offset="0x0410" name="RBBM_PERFCTR_UCHE_4_LO"/>
+	<reg32 offset="0x0411" name="RBBM_PERFCTR_UCHE_4_HI"/>
+	<reg32 offset="0x0412" name="RBBM_PERFCTR_UCHE_5_LO"/>
+	<reg32 offset="0x0413" name="RBBM_PERFCTR_UCHE_5_HI"/>
+	<reg32 offset="0x0414" name="RBBM_PERFCTR_UCHE_6_LO"/>
+	<reg32 offset="0x0415" name="RBBM_PERFCTR_UCHE_6_HI"/>
+	<reg32 offset="0x0416" name="RBBM_PERFCTR_UCHE_7_LO"/>
+	<reg32 offset="0x0417" name="RBBM_PERFCTR_UCHE_7_HI"/>
+	<reg32 offset="0x0418" name="RBBM_PERFCTR_TP_0_LO"/>
+	<reg32 offset="0x0419" name="RBBM_PERFCTR_TP_0_HI"/>
+	<reg32 offset="0x041a" name="RBBM_PERFCTR_TP_1_LO"/>
+	<reg32 offset="0x041b" name="RBBM_PERFCTR_TP_1_HI"/>
+	<reg32 offset="0x041c" name="RBBM_PERFCTR_TP_2_LO"/>
+	<reg32 offset="0x041d" name="RBBM_PERFCTR_TP_2_HI"/>
+	<reg32 offset="0x041e" name="RBBM_PERFCTR_TP_3_LO"/>
+	<reg32 offset="0x041f" name="RBBM_PERFCTR_TP_3_HI"/>
+	<reg32 offset="0x0420" name="RBBM_PERFCTR_TP_4_LO"/>
+	<reg32 offset="0x0421" name="RBBM_PERFCTR_TP_4_HI"/>
+	<reg32 offset="0x0422" name="RBBM_PERFCTR_TP_5_LO"/>
+	<reg32 offset="0x0423" name="RBBM_PERFCTR_TP_5_HI"/>
+	<reg32 offset="0x0424" name="RBBM_PERFCTR_TP_6_LO"/>
+	<reg32 offset="0x0425" name="RBBM_PERFCTR_TP_6_HI"/>
+	<reg32 offset="0x0426" name="RBBM_PERFCTR_TP_7_LO"/>
+	<reg32 offset="0x0427" name="RBBM_PERFCTR_TP_7_HI"/>
+	<reg32 offset="0x0428" name="RBBM_PERFCTR_SP_0_LO"/>
+	<reg32 offset="0x0429" name="RBBM_PERFCTR_SP_0_HI"/>
+	<reg32 offset="0x042a" name="RBBM_PERFCTR_SP_1_LO"/>
+	<reg32 offset="0x042b" name="RBBM_PERFCTR_SP_1_HI"/>
+	<reg32 offset="0x042c" name="RBBM_PERFCTR_SP_2_LO"/>
+	<reg32 offset="0x042d" name="RBBM_PERFCTR_SP_2_HI"/>
+	<reg32 offset="0x042e" name="RBBM_PERFCTR_SP_3_LO"/>
+	<reg32 offset="0x042f" name="RBBM_PERFCTR_SP_3_HI"/>
+	<reg32 offset="0x0430" name="RBBM_PERFCTR_SP_4_LO"/>
+	<reg32 offset="0x0431" name="RBBM_PERFCTR_SP_4_HI"/>
+	<reg32 offset="0x0432" name="RBBM_PERFCTR_SP_5_LO"/>
+	<reg32 offset="0x0433" name="RBBM_PERFCTR_SP_5_HI"/>
+	<reg32 offset="0x0434" name="RBBM_PERFCTR_SP_6_LO"/>
+	<reg32 offset="0x0435" name="RBBM_PERFCTR_SP_6_HI"/>
+	<reg32 offset="0x0436" name="RBBM_PERFCTR_SP_7_LO"/>
+	<reg32 offset="0x0437" name="RBBM_PERFCTR_SP_7_HI"/>
+	<reg32 offset="0x0438" name="RBBM_PERFCTR_SP_8_LO"/>
+	<reg32 offset="0x0439" name="RBBM_PERFCTR_SP_8_HI"/>
+	<reg32 offset="0x043a" name="RBBM_PERFCTR_SP_9_LO"/>
+	<reg32 offset="0x043b" name="RBBM_PERFCTR_SP_9_HI"/>
+	<reg32 offset="0x043c" name="RBBM_PERFCTR_SP_10_LO"/>
+	<reg32 offset="0x043d" name="RBBM_PERFCTR_SP_10_HI"/>
+	<reg32 offset="0x043e" name="RBBM_PERFCTR_SP_11_LO"/>
+	<reg32 offset="0x043f" name="RBBM_PERFCTR_SP_11_HI"/>
+	<reg32 offset="0x0440" name="RBBM_PERFCTR_RB_0_LO"/>
+	<reg32 offset="0x0441" name="RBBM_PERFCTR_RB_0_HI"/>
+	<reg32 offset="0x0442" name="RBBM_PERFCTR_RB_1_LO"/>
+	<reg32 offset="0x0443" name="RBBM_PERFCTR_RB_1_HI"/>
+	<reg32 offset="0x0444" name="RBBM_PERFCTR_RB_2_LO"/>
+	<reg32 offset="0x0445" name="RBBM_PERFCTR_RB_2_HI"/>
+	<reg32 offset="0x0446" name="RBBM_PERFCTR_RB_3_LO"/>
+	<reg32 offset="0x0447" name="RBBM_PERFCTR_RB_3_HI"/>
+	<reg32 offset="0x0448" name="RBBM_PERFCTR_RB_4_LO"/>
+	<reg32 offset="0x0449" name="RBBM_PERFCTR_RB_4_HI"/>
+	<reg32 offset="0x044a" name="RBBM_PERFCTR_RB_5_LO"/>
+	<reg32 offset="0x044b" name="RBBM_PERFCTR_RB_5_HI"/>
+	<reg32 offset="0x044c" name="RBBM_PERFCTR_RB_6_LO"/>
+	<reg32 offset="0x044d" name="RBBM_PERFCTR_RB_6_HI"/>
+	<reg32 offset="0x044e" name="RBBM_PERFCTR_RB_7_LO"/>
+	<reg32 offset="0x044f" name="RBBM_PERFCTR_RB_7_HI"/>
+	<reg32 offset="0x0450" name="RBBM_PERFCTR_VSC_0_LO"/>
+	<reg32 offset="0x0451" name="RBBM_PERFCTR_VSC_0_HI"/>
+	<reg32 offset="0x0452" name="RBBM_PERFCTR_VSC_1_LO"/>
+	<reg32 offset="0x0453" name="RBBM_PERFCTR_VSC_1_HI"/>
+	<reg32 offset="0x0454" name="RBBM_PERFCTR_LRZ_0_LO"/>
+	<reg32 offset="0x0455" name="RBBM_PERFCTR_LRZ_0_HI"/>
+	<reg32 offset="0x0456" name="RBBM_PERFCTR_LRZ_1_LO"/>
+	<reg32 offset="0x0457" name="RBBM_PERFCTR_LRZ_1_HI"/>
+	<reg32 offset="0x0458" name="RBBM_PERFCTR_LRZ_2_LO"/>
+	<reg32 offset="0x0459" name="RBBM_PERFCTR_LRZ_2_HI"/>
+	<reg32 offset="0x045a" name="RBBM_PERFCTR_LRZ_3_LO"/>
+	<reg32 offset="0x045b" name="RBBM_PERFCTR_LRZ_3_HI"/>
+	<reg32 offset="0x045c" name="RBBM_PERFCTR_CMP_0_LO"/>
+	<reg32 offset="0x045d" name="RBBM_PERFCTR_CMP_0_HI"/>
+	<reg32 offset="0x045e" name="RBBM_PERFCTR_CMP_1_LO"/>
+	<reg32 offset="0x045f" name="RBBM_PERFCTR_CMP_1_HI"/>
+	<reg32 offset="0x0460" name="RBBM_PERFCTR_CMP_2_LO"/>
+	<reg32 offset="0x0461" name="RBBM_PERFCTR_CMP_2_HI"/>
+	<reg32 offset="0x0462" name="RBBM_PERFCTR_CMP_3_LO"/>
+	<reg32 offset="0x0463" name="RBBM_PERFCTR_CMP_3_HI"/>
+	<reg32 offset="0x046b" name="RBBM_PERFCTR_RBBM_SEL_0" type="a5xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x046c" name="RBBM_PERFCTR_RBBM_SEL_1" type="a5xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x046d" name="RBBM_PERFCTR_RBBM_SEL_2" type="a5xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x046e" name="RBBM_PERFCTR_RBBM_SEL_3" type="a5xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x04d2" name="RBBM_ALWAYSON_COUNTER_LO"/>
+	<reg32 offset="0x04d3" name="RBBM_ALWAYSON_COUNTER_HI"/>
+	<reg32 offset="0x04f5" name="RBBM_STATUS">
+		<bitfield high="31" low="31" name="GPU_BUSY_IGN_AHB" />
+		<bitfield high="30" low="30" name="GPU_BUSY_IGN_AHB_CP" />
+		<bitfield high="29" low="29" name="HLSQ_BUSY" />
+		<bitfield high="28" low="28" name="VSC_BUSY" />
+		<bitfield high="27" low="27" name="TPL1_BUSY" />
+		<bitfield high="26" low="26" name="SP_BUSY" />
+		<bitfield high="25" low="25" name="UCHE_BUSY" />
+		<bitfield high="24" low="24" name="VPC_BUSY" />
+		<bitfield high="23" low="23" name="VFDP_BUSY" />
+		<bitfield high="22" low="22" name="VFD_BUSY" />
+		<bitfield high="21" low="21" name="TESS_BUSY" />
+		<bitfield high="20" low="20" name="PC_VSD_BUSY" />
+		<bitfield high="19" low="19" name="PC_DCALL_BUSY" />
+		<bitfield high="18" low="18" name="GPMU_SLAVE_BUSY" />
+		<bitfield high="17" low="17" name="DCOM_BUSY" />
+		<bitfield high="16" low="16" name="COM_BUSY" />
+		<bitfield high="15" low="15" name="LRZ_BUZY" />
+		<bitfield high="14" low="14" name="A2D_DSP_BUSY" />
+		<bitfield high="13" low="13" name="CCUFCHE_BUSY" />
+		<bitfield high="12" low="12" name="RB_BUSY" />
+		<bitfield high="11" low="11" name="RAS_BUSY" />
+		<bitfield high="10" low="10" name="TSE_BUSY" />
+		<bitfield high="9" low="9" name="VBIF_BUSY" />
+		<bitfield high="8" low="8" name="GPU_BUSY_IGN_AHB_HYST" />
+		<bitfield high="7" low="7" name="CP_BUSY_IGN_HYST" />
+		<bitfield high="6" low="6" name="CP_BUSY" />
+		<bitfield high="5" low="5" name="GPMU_MASTER_BUSY" />
+		<bitfield high="4" low="4" name="CP_CRASH_BUSY" />
+		<bitfield high="3" low="3" name="CP_ETS_BUSY" />
+		<bitfield high="2" low="2" name="CP_PFP_BUSY" />
+		<bitfield high="1" low="1" name="CP_ME_BUSY" />
+		<bitfield high="0" low="0" name="HI_BUSY" />
+	</reg32>
+	<reg32 offset="0x0530" name="RBBM_STATUS3">
+		<bitfield pos="24" name="SMMU_STALLED_ON_FAULT" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x04e1" name="RBBM_INT_0_STATUS"/>
+	<reg32 offset="0x04f0" name="RBBM_AHB_ME_SPLIT_STATUS"/>
+	<reg32 offset="0x04f1" name="RBBM_AHB_PFP_SPLIT_STATUS"/>
+	<reg32 offset="0x04f3" name="RBBM_AHB_ETS_SPLIT_STATUS"/>
+	<reg32 offset="0x04f4" name="RBBM_AHB_ERROR_STATUS"/>
+	<reg32 offset="0x0464" name="RBBM_PERFCTR_CNTL"/>
+	<reg32 offset="0x0465" name="RBBM_PERFCTR_LOAD_CMD0"/>
+	<reg32 offset="0x0466" name="RBBM_PERFCTR_LOAD_CMD1"/>
+	<reg32 offset="0x0467" name="RBBM_PERFCTR_LOAD_CMD2"/>
+	<reg32 offset="0x0468" name="RBBM_PERFCTR_LOAD_CMD3"/>
+	<reg32 offset="0x0469" name="RBBM_PERFCTR_LOAD_VALUE_LO"/>
+	<reg32 offset="0x046a" name="RBBM_PERFCTR_LOAD_VALUE_HI"/>
+	<reg32 offset="0x046f" name="RBBM_PERFCTR_GPU_BUSY_MASKED"/>
+	<reg32 offset="0x04ed" name="RBBM_AHB_ERROR"/>
+	<reg32 offset="0x0504" name="RBBM_CFG_DBGBUS_EVENT_LOGIC"/>
+	<reg32 offset="0x0505" name="RBBM_CFG_DBGBUS_OVER"/>
+	<reg32 offset="0x0506" name="RBBM_CFG_DBGBUS_COUNT0"/>
+	<reg32 offset="0x0507" name="RBBM_CFG_DBGBUS_COUNT1"/>
+	<reg32 offset="0x0508" name="RBBM_CFG_DBGBUS_COUNT2"/>
+	<reg32 offset="0x0509" name="RBBM_CFG_DBGBUS_COUNT3"/>
+	<reg32 offset="0x050a" name="RBBM_CFG_DBGBUS_COUNT4"/>
+	<reg32 offset="0x050b" name="RBBM_CFG_DBGBUS_COUNT5"/>
+	<reg32 offset="0x050c" name="RBBM_CFG_DBGBUS_TRACE_ADDR"/>
+	<reg32 offset="0x050d" name="RBBM_CFG_DBGBUS_TRACE_BUF0"/>
+	<reg32 offset="0x050e" name="RBBM_CFG_DBGBUS_TRACE_BUF1"/>
+	<reg32 offset="0x050f" name="RBBM_CFG_DBGBUS_TRACE_BUF2"/>
+	<reg32 offset="0x0510" name="RBBM_CFG_DBGBUS_TRACE_BUF3"/>
+	<reg32 offset="0x0511" name="RBBM_CFG_DBGBUS_TRACE_BUF4"/>
+	<reg32 offset="0x0512" name="RBBM_CFG_DBGBUS_MISR0"/>
+	<reg32 offset="0x0513" name="RBBM_CFG_DBGBUS_MISR1"/>
+	<reg32 offset="0x0533" name="RBBM_ISDB_CNT"/>
+	<reg32 offset="0xf000" name="RBBM_SECVID_TRUST_CONFIG"/>
+	<reg32 offset="0xf400" name="RBBM_SECVID_TRUST_CNTL"/>
+	<reg32 offset="0xf800" name="RBBM_SECVID_TSB_TRUSTED_BASE_LO"/>
+	<reg32 offset="0xf801" name="RBBM_SECVID_TSB_TRUSTED_BASE_HI"/>
+	<reg32 offset="0xf802" name="RBBM_SECVID_TSB_TRUSTED_SIZE"/>
+	<reg32 offset="0xf803" name="RBBM_SECVID_TSB_CNTL"/>
+	<reg32 offset="0xf804" name="RBBM_SECVID_TSB_COMP_STATUS_LO"/>
+	<reg32 offset="0xf805" name="RBBM_SECVID_TSB_COMP_STATUS_HI"/>
+	<reg32 offset="0xf806" name="RBBM_SECVID_TSB_UCHE_STATUS_LO"/>
+	<reg32 offset="0xf807" name="RBBM_SECVID_TSB_UCHE_STATUS_HI"/>
+	<reg32 offset="0xf810" name="RBBM_SECVID_TSB_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+
+	<!-- VSC registers -->
+	<reg32 offset="0x0bc2" name="VSC_BIN_SIZE">
+		<bitfield name="WIDTH" low="0" high="7" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="9" high="16" shr="5" type="uint"/>
+		<!-- b17 maybe BYPASS like RB_CNTL, but reg not written for bypass -->
+	</reg32>
+	<reg32 offset="0x0bc3" name="VSC_SIZE_ADDRESS_LO"/>
+	<reg32 offset="0x0bc4" name="VSC_SIZE_ADDRESS_HI"/>
+	<reg32 offset="0x0bc5" name="UNKNOWN_0BC5"/> <!-- always 00000000? -->
+	<reg32 offset="0x0bc6" name="UNKNOWN_0BC6"/> <!-- always 00000000? -->
+	<array offset="0x0bd0" name="VSC_PIPE_CONFIG" stride="1" length="16">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				Configures the mapping between VSC_PIPE buffer and
+				bin, X/Y specify the bin index in the horiz/vert
+				direction (0,0 is upper left, 0,1 is leftmost bin
+				on second row, and so on).  W/H specify the number
+				of bins assigned to this VSC_PIPE in the horiz/vert
+				dimension.
+			</doc>
+			<bitfield name="X" low="0" high="9" type="uint"/>
+			<bitfield name="Y" low="10" high="19" type="uint"/>
+			<bitfield name="W" low="20" high="23" type="uint"/>
+			<bitfield name="H" low="24" high="27" type="uint"/>
+		</reg32>
+	</array>
+	<array offset="0x0be0" name="VSC_PIPE_DATA_ADDRESS" stride="2" length="16">
+		<reg32 offset="0x0" name="LO"/>
+		<reg32 offset="0x1" name="HI"/>
+	</array>
+	<array offset="0x0c00" name="VSC_PIPE_DATA_LENGTH" stride="1" length="16">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<reg32 offset="0x0c60" name="VSC_PERFCTR_VSC_SEL_0" type="a5xx_vsc_perfcounter_select"/>
+	<reg32 offset="0x0c61" name="VSC_PERFCTR_VSC_SEL_1" type="a5xx_vsc_perfcounter_select"/>
+
+	<!-- used for some blits?? -->
+	<reg32 offset="0x0cdd" name="VSC_RESOLVE_CNTL" type="adreno_reg_xy"/>
+
+	<!-- GRAS registers -->
+	<reg32 offset="0x0c81" name="GRAS_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0c90" name="GRAS_PERFCTR_TSE_SEL_0" type="a5xx_tse_perfcounter_select"/>
+	<reg32 offset="0x0c91" name="GRAS_PERFCTR_TSE_SEL_1" type="a5xx_tse_perfcounter_select"/>
+	<reg32 offset="0x0c92" name="GRAS_PERFCTR_TSE_SEL_2" type="a5xx_tse_perfcounter_select"/>
+	<reg32 offset="0x0c93" name="GRAS_PERFCTR_TSE_SEL_3" type="a5xx_tse_perfcounter_select"/>
+	<reg32 offset="0x0c94" name="GRAS_PERFCTR_RAS_SEL_0" type="a5xx_ras_perfcounter_select"/>
+	<reg32 offset="0x0c95" name="GRAS_PERFCTR_RAS_SEL_1" type="a5xx_ras_perfcounter_select"/>
+	<reg32 offset="0x0c96" name="GRAS_PERFCTR_RAS_SEL_2" type="a5xx_ras_perfcounter_select"/>
+	<reg32 offset="0x0c97" name="GRAS_PERFCTR_RAS_SEL_3" type="a5xx_ras_perfcounter_select"/>
+	<reg32 offset="0x0c98" name="GRAS_PERFCTR_LRZ_SEL_0" type="a5xx_lrz_perfcounter_select"/>
+	<reg32 offset="0x0c99" name="GRAS_PERFCTR_LRZ_SEL_1" type="a5xx_lrz_perfcounter_select"/>
+	<reg32 offset="0x0c9a" name="GRAS_PERFCTR_LRZ_SEL_2" type="a5xx_lrz_perfcounter_select"/>
+	<reg32 offset="0x0c9b" name="GRAS_PERFCTR_LRZ_SEL_3" type="a5xx_lrz_perfcounter_select"/>
+
+	<reg32 offset="0x0cc4" name="RB_DBG_ECO_CNTL"/> <!-- always 00100000? -->
+	<reg32 offset="0x0cc5" name="RB_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0cc6" name="RB_MODE_CNTL"/> <!-- always 00000044? -->
+	<reg32 offset="0x0cc7" name="RB_CCU_CNTL"/> <!-- always b0056080 or 10000000? -->
+	<reg32 offset="0x0cd0" name="RB_PERFCTR_RB_SEL_0" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd1" name="RB_PERFCTR_RB_SEL_1" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd2" name="RB_PERFCTR_RB_SEL_2" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd3" name="RB_PERFCTR_RB_SEL_3" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd4" name="RB_PERFCTR_RB_SEL_4" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd5" name="RB_PERFCTR_RB_SEL_5" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd6" name="RB_PERFCTR_RB_SEL_6" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd7" name="RB_PERFCTR_RB_SEL_7" type="a5xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cd8" name="RB_PERFCTR_CCU_SEL_0" type="a5xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cd9" name="RB_PERFCTR_CCU_SEL_1" type="a5xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cda" name="RB_PERFCTR_CCU_SEL_2" type="a5xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cdb" name="RB_PERFCTR_CCU_SEL_3" type="a5xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0ce0" name="RB_POWERCTR_RB_SEL_0"/>
+	<reg32 offset="0x0ce1" name="RB_POWERCTR_RB_SEL_1"/>
+	<reg32 offset="0x0ce2" name="RB_POWERCTR_RB_SEL_2"/>
+	<reg32 offset="0x0ce3" name="RB_POWERCTR_RB_SEL_3"/>
+	<reg32 offset="0x0ce4" name="RB_POWERCTR_CCU_SEL_0"/>
+	<reg32 offset="0x0ce5" name="RB_POWERCTR_CCU_SEL_1"/>
+	<reg32 offset="0x0cec" name="RB_PERFCTR_CMP_SEL_0" type="a5xx_cmp_perfcounter_select"/>
+	<reg32 offset="0x0ced" name="RB_PERFCTR_CMP_SEL_1" type="a5xx_cmp_perfcounter_select"/>
+	<reg32 offset="0x0cee" name="RB_PERFCTR_CMP_SEL_2" type="a5xx_cmp_perfcounter_select"/>
+	<reg32 offset="0x0cef" name="RB_PERFCTR_CMP_SEL_3" type="a5xx_cmp_perfcounter_select"/>
+
+	<reg32 offset="0x0d00" name="PC_DBG_ECO_CNTL">
+		<bitfield name="TWOPASSUSEWFI" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0d01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0d02" name="PC_MODE_CNTL"/> <!-- always 0000001f? -->
+	<reg32 offset="0x0d04" name="PC_INDEX_BUF_LO"/>
+	<reg32 offset="0x0d05" name="PC_INDEX_BUF_HI"/>
+	<reg32 offset="0x0d06" name="PC_START_INDEX"/>
+	<reg32 offset="0x0d07" name="PC_MAX_INDEX"/>
+	<reg32 offset="0x0d08" name="PC_TESSFACTOR_ADDR_LO"/>
+	<reg32 offset="0x0d09" name="PC_TESSFACTOR_ADDR_HI"/>
+	<reg32 offset="0x0d10" name="PC_PERFCTR_PC_SEL_0" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d11" name="PC_PERFCTR_PC_SEL_1" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d12" name="PC_PERFCTR_PC_SEL_2" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d13" name="PC_PERFCTR_PC_SEL_3" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d14" name="PC_PERFCTR_PC_SEL_4" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d15" name="PC_PERFCTR_PC_SEL_5" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d16" name="PC_PERFCTR_PC_SEL_6" type="a5xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d17" name="PC_PERFCTR_PC_SEL_7" type="a5xx_pc_perfcounter_select"/>
+
+	<reg32 offset="0x0e00" name="HLSQ_TIMEOUT_THRESHOLD_0"/>
+	<reg32 offset="0x0e01" name="HLSQ_TIMEOUT_THRESHOLD_1"/>
+	<reg32 offset="0x0e04" name="HLSQ_DBG_ECO_CNTL"/>
+	<reg32 offset="0x0e05" name="HLSQ_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0e06" name="HLSQ_MODE_CNTL"/> <!-- always 00000001? -->
+	<reg32 offset="0x0e10" name="HLSQ_PERFCTR_HLSQ_SEL_0" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e11" name="HLSQ_PERFCTR_HLSQ_SEL_1" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e12" name="HLSQ_PERFCTR_HLSQ_SEL_2" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e13" name="HLSQ_PERFCTR_HLSQ_SEL_3" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e14" name="HLSQ_PERFCTR_HLSQ_SEL_4" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e15" name="HLSQ_PERFCTR_HLSQ_SEL_5" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e16" name="HLSQ_PERFCTR_HLSQ_SEL_6" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e17" name="HLSQ_PERFCTR_HLSQ_SEL_7" type="a5xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0f08" name="HLSQ_SPTP_RDSEL"/>
+	<reg32 offset="0xbc00" name="HLSQ_DBG_READ_SEL"/>
+	<reg32 offset="0xa000" name="HLSQ_DBG_AHB_READ_APERTURE"/>
+
+	<reg32 offset="0x0e41" name="VFD_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0e42" name="VFD_MODE_CNTL"/> <!-- always 00000000? -->
+	<reg32 offset="0x0e50" name="VFD_PERFCTR_VFD_SEL_0" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e51" name="VFD_PERFCTR_VFD_SEL_1" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e52" name="VFD_PERFCTR_VFD_SEL_2" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e53" name="VFD_PERFCTR_VFD_SEL_3" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e54" name="VFD_PERFCTR_VFD_SEL_4" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e55" name="VFD_PERFCTR_VFD_SEL_5" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e56" name="VFD_PERFCTR_VFD_SEL_6" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e57" name="VFD_PERFCTR_VFD_SEL_7" type="a5xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e60" name="VPC_DBG_ECO_CNTL">
+		<bitfield name="ALLFLATOPTDIS" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0e61" name="VPC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0e62" name="VPC_MODE_CNTL">
+		<bitfield name="BINNING_PASS" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0e64" name="VPC_PERFCTR_VPC_SEL_0" type="a5xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e65" name="VPC_PERFCTR_VPC_SEL_1" type="a5xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e66" name="VPC_PERFCTR_VPC_SEL_2" type="a5xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e67" name="VPC_PERFCTR_VPC_SEL_3" type="a5xx_vpc_perfcounter_select"/>
+
+	<reg32 offset="0x0e80" name="UCHE_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0e81" name="UCHE_MODE_CNTL"/>
+	<reg32 offset="0x0e82" name="UCHE_SVM_CNTL"/>
+	<reg32 offset="0x0e87" name="UCHE_WRITE_THRU_BASE_LO"/>
+	<reg32 offset="0x0e88" name="UCHE_WRITE_THRU_BASE_HI"/>
+	<reg32 offset="0x0e89" name="UCHE_TRAP_BASE_LO"/>
+	<reg32 offset="0x0e8a" name="UCHE_TRAP_BASE_HI"/>
+	<reg32 offset="0x0e8b" name="UCHE_GMEM_RANGE_MIN_LO"/>
+	<reg32 offset="0x0e8c" name="UCHE_GMEM_RANGE_MIN_HI"/>
+	<reg32 offset="0x0e8d" name="UCHE_GMEM_RANGE_MAX_LO"/>
+	<reg32 offset="0x0e8e" name="UCHE_GMEM_RANGE_MAX_HI"/>
+	<reg32 offset="0x0e8f" name="UCHE_DBG_ECO_CNTL_2"/>
+	<reg32 offset="0x0e90" name="UCHE_DBG_ECO_CNTL"/>
+	<reg32 offset="0x0e91" name="UCHE_CACHE_INVALIDATE_MIN_LO"/>
+	<reg32 offset="0x0e92" name="UCHE_CACHE_INVALIDATE_MIN_HI"/>
+	<reg32 offset="0x0e93" name="UCHE_CACHE_INVALIDATE_MAX_LO"/>
+	<reg32 offset="0x0e94" name="UCHE_CACHE_INVALIDATE_MAX_HI"/>
+	<reg32 offset="0x0e95" name="UCHE_CACHE_INVALIDATE"/>
+	<reg32 offset="0x0e96" name="UCHE_CACHE_WAYS"/>
+	<reg32 offset="0x0ea0" name="UCHE_PERFCTR_UCHE_SEL_0" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea1" name="UCHE_PERFCTR_UCHE_SEL_1" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea2" name="UCHE_PERFCTR_UCHE_SEL_2" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea3" name="UCHE_PERFCTR_UCHE_SEL_3" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea4" name="UCHE_PERFCTR_UCHE_SEL_4" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea5" name="UCHE_PERFCTR_UCHE_SEL_5" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea6" name="UCHE_PERFCTR_UCHE_SEL_6" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea7" name="UCHE_PERFCTR_UCHE_SEL_7" type="a5xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea8" name="UCHE_POWERCTR_UCHE_SEL_0"/>
+	<reg32 offset="0x0ea9" name="UCHE_POWERCTR_UCHE_SEL_1"/>
+	<reg32 offset="0x0eaa" name="UCHE_POWERCTR_UCHE_SEL_2"/>
+	<reg32 offset="0x0eab" name="UCHE_POWERCTR_UCHE_SEL_3"/>
+	<reg32 offset="0x0eb1" name="UCHE_TRAP_LOG_LO"/>
+	<reg32 offset="0x0eb2" name="UCHE_TRAP_LOG_HI"/>
+
+	<reg32 offset="0x0ec0" name="SP_DBG_ECO_CNTL"/>
+	<reg32 offset="0x0ec1" name="SP_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0ec2" name="SP_MODE_CNTL"/> <!-- always 0000001e? -->
+	<reg32 offset="0x0ed0" name="SP_PERFCTR_SP_SEL_0"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed1" name="SP_PERFCTR_SP_SEL_1"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed2" name="SP_PERFCTR_SP_SEL_2"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed3" name="SP_PERFCTR_SP_SEL_3"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed4" name="SP_PERFCTR_SP_SEL_4"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed5" name="SP_PERFCTR_SP_SEL_5"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed6" name="SP_PERFCTR_SP_SEL_6"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed7" name="SP_PERFCTR_SP_SEL_7"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed8" name="SP_PERFCTR_SP_SEL_8"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ed9" name="SP_PERFCTR_SP_SEL_9"  type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0eda" name="SP_PERFCTR_SP_SEL_10" type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0edb" name="SP_PERFCTR_SP_SEL_11" type="a5xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0edc" name="SP_POWERCTR_SP_SEL_0"/>
+	<reg32 offset="0x0edd" name="SP_POWERCTR_SP_SEL_1"/>
+	<reg32 offset="0x0ede" name="SP_POWERCTR_SP_SEL_2"/>
+	<reg32 offset="0x0edf" name="SP_POWERCTR_SP_SEL_3"/>
+
+	<reg32 offset="0x0f01" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
+	<reg32 offset="0x0f02" name="TPL1_MODE_CNTL"/> <!-- always 00000544? -->
+	<reg32 offset="0x0f10" name="TPL1_PERFCTR_TP_SEL_0" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f11" name="TPL1_PERFCTR_TP_SEL_1" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f12" name="TPL1_PERFCTR_TP_SEL_2" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f13" name="TPL1_PERFCTR_TP_SEL_3" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f14" name="TPL1_PERFCTR_TP_SEL_4" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f15" name="TPL1_PERFCTR_TP_SEL_5" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f16" name="TPL1_PERFCTR_TP_SEL_6" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f17" name="TPL1_PERFCTR_TP_SEL_7" type="a5xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f18" name="TPL1_POWERCTR_TP_SEL_0"/>
+	<reg32 offset="0x0f19" name="TPL1_POWERCTR_TP_SEL_1"/>
+	<reg32 offset="0x0f1a" name="TPL1_POWERCTR_TP_SEL_2"/>
+	<reg32 offset="0x0f1b" name="TPL1_POWERCTR_TP_SEL_3"/>
+
+	<reg32 offset="0x3000" name="VBIF_VERSION"/>
+	<reg32 offset="0x3001" name="VBIF_CLKON"/>
+<!--
+#define A5XX_VBIF_CLKON_FORCE_ON_TESTBUS_MASK   0x1
+#define A5XX_VBIF_CLKON_FORCE_ON_TESTBUS_SHIFT  0x1
+ -->
+	<reg32 offset="0x3028" name="VBIF_ABIT_SORT"/>
+	<reg32 offset="0x3029" name="VBIF_ABIT_SORT_CONF"/>
+	<reg32 offset="0x3049" name="VBIF_ROUND_ROBIN_QOS_ARB"/>
+	<reg32 offset="0x302a" name="VBIF_GATE_OFF_WRREQ_EN"/>
+	<reg32 offset="0x302c" name="VBIF_IN_RD_LIM_CONF0"/>
+	<reg32 offset="0x302d" name="VBIF_IN_RD_LIM_CONF1"/>
+	<reg32 offset="0x3080" name="VBIF_XIN_HALT_CTRL0"/>
+<!--
+#define A5XX_VBIF_XIN_HALT_CTRL0_MASK	   0xF
+#define A510_VBIF_XIN_HALT_CTRL0_MASK	   0x7
+ -->
+	<reg32 offset="0x3081" name="VBIF_XIN_HALT_CTRL1"/>
+	<reg32 offset="0x3084" name="VBIF_TEST_BUS_OUT_CTRL"/>
+<!--
+#define A5XX_VBIF_TEST_BUS_OUT_CTRL_EN_MASK    0x1
+#define A5XX_VBIF_TEST_BUS_OUT_CTRL_EN_SHIFT   0x0
+ -->
+	<reg32 offset="0x3085" name="VBIF_TEST_BUS1_CTRL0"/>
+	<reg32 offset="0x3086" name="VBIF_TEST_BUS1_CTRL1"/>
+<!--
+#define A5XX_VBIF_TEST_BUS1_CTRL1_DATA_SEL_MASK  0xF
+#define A5XX_VBIF_TEST_BUS1_CTRL1_DATA_SEL_SHIFT 0x0
+ -->
+	<reg32 offset="0x3087" name="VBIF_TEST_BUS2_CTRL0"/>
+	<reg32 offset="0x3088" name="VBIF_TEST_BUS2_CTRL1"/>
+<!--
+#define A5XX_VBIF_TEST_BUS2_CTRL1_DATA_SEL_MASK     0xF
+#define A5XX_VBIF_TEST_BUS2_CTRL1_DATA_SEL_SHIFT    0x0
+ -->
+	<reg32 offset="0x308c" name="VBIF_TEST_BUS_OUT"/>
+	<reg32 offset="0x30c0" name="VBIF_PERF_CNT_EN0"/>
+	<reg32 offset="0x30c1" name="VBIF_PERF_CNT_EN1"/>
+	<reg32 offset="0x30c2" name="VBIF_PERF_CNT_EN2"/>
+	<reg32 offset="0x30c3" name="VBIF_PERF_CNT_EN3"/>
+	<reg32 offset="0x30c8" name="VBIF_PERF_CNT_CLR0"/>
+	<reg32 offset="0x30c9" name="VBIF_PERF_CNT_CLR1"/>
+	<reg32 offset="0x30ca" name="VBIF_PERF_CNT_CLR2"/>
+	<reg32 offset="0x30cb" name="VBIF_PERF_CNT_CLR3"/>
+	<reg32 offset="0x30d0" name="VBIF_PERF_CNT_SEL0" type="a5xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d1" name="VBIF_PERF_CNT_SEL1" type="a5xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d2" name="VBIF_PERF_CNT_SEL2" type="a5xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d3" name="VBIF_PERF_CNT_SEL3" type="a5xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d8" name="VBIF_PERF_CNT_LOW0"/>
+	<reg32 offset="0x30d9" name="VBIF_PERF_CNT_LOW1"/>
+	<reg32 offset="0x30da" name="VBIF_PERF_CNT_LOW2"/>
+	<reg32 offset="0x30db" name="VBIF_PERF_CNT_LOW3"/>
+	<reg32 offset="0x30e0" name="VBIF_PERF_CNT_HIGH0"/>
+	<reg32 offset="0x30e1" name="VBIF_PERF_CNT_HIGH1"/>
+	<reg32 offset="0x30e2" name="VBIF_PERF_CNT_HIGH2"/>
+	<reg32 offset="0x30e3" name="VBIF_PERF_CNT_HIGH3"/>
+	<reg32 offset="0x3100" name="VBIF_PERF_PWR_CNT_EN0"/>
+	<reg32 offset="0x3101" name="VBIF_PERF_PWR_CNT_EN1"/>
+	<reg32 offset="0x3102" name="VBIF_PERF_PWR_CNT_EN2"/>
+	<reg32 offset="0x3110" name="VBIF_PERF_PWR_CNT_LOW0"/>
+	<reg32 offset="0x3111" name="VBIF_PERF_PWR_CNT_LOW1"/>
+	<reg32 offset="0x3112" name="VBIF_PERF_PWR_CNT_LOW2"/>
+	<reg32 offset="0x3118" name="VBIF_PERF_PWR_CNT_HIGH0"/>
+	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
+	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
+
+	<reg32 offset="0x8800" name="GPMU_INST_RAM_BASE"/>
+	<reg32 offset="0x9800" name="GPMU_DATA_RAM_BASE"/>
+
+<!--
+/* COUNTABLE FOR SP PERFCOUNTER */
+#define A5XX_SP_ALU_ACTIVE_CYCLES          0x1
+#define A5XX_SP0_ICL1_MISSES               0x35
+#define A5XX_SP_FS_CFLOW_INSTRUCTIONS      0x27
+
+/* COUNTABLE FOR TSE PERFCOUNTER */
+#define A5XX_TSE_INPUT_PRIM_NUM            0x6
+ -->
+	<reg32 offset="0xa840" name="SP_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa841" name="SP_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa842" name="SP_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa843" name="SP_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa844" name="SP_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa845" name="SP_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa846" name="SP_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa847" name="SP_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa848" name="TP_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa849" name="TP_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa84a" name="TP_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa84b" name="TP_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa84c" name="TP_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa84d" name="TP_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa84e" name="TP_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa84f" name="TP_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa850" name="RB_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa851" name="RB_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa852" name="RB_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa853" name="RB_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa854" name="RB_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa855" name="RB_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa856" name="RB_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa857" name="RB_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa858" name="CCU_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa859" name="CCU_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa85a" name="CCU_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa85b" name="CCU_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa85c" name="UCHE_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa85d" name="UCHE_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa85e" name="UCHE_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa85f" name="UCHE_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa860" name="UCHE_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa861" name="UCHE_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa862" name="UCHE_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa863" name="UCHE_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa864" name="CP_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa865" name="CP_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa866" name="CP_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa867" name="CP_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa868" name="CP_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa869" name="CP_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa86a" name="CP_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa86b" name="CP_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa86c" name="GPMU_POWER_COUNTER_0_LO"/>
+	<reg32 offset="0xa86d" name="GPMU_POWER_COUNTER_0_HI"/>
+	<reg32 offset="0xa86e" name="GPMU_POWER_COUNTER_1_LO"/>
+	<reg32 offset="0xa86f" name="GPMU_POWER_COUNTER_1_HI"/>
+	<reg32 offset="0xa870" name="GPMU_POWER_COUNTER_2_LO"/>
+	<reg32 offset="0xa871" name="GPMU_POWER_COUNTER_2_HI"/>
+	<reg32 offset="0xa872" name="GPMU_POWER_COUNTER_3_LO"/>
+	<reg32 offset="0xa873" name="GPMU_POWER_COUNTER_3_HI"/>
+	<reg32 offset="0xa874" name="GPMU_POWER_COUNTER_4_LO"/>
+	<reg32 offset="0xa875" name="GPMU_POWER_COUNTER_4_HI"/>
+	<reg32 offset="0xa876" name="GPMU_POWER_COUNTER_5_LO"/>
+	<reg32 offset="0xa877" name="GPMU_POWER_COUNTER_5_HI"/>
+	<reg32 offset="0xa878" name="GPMU_POWER_COUNTER_ENABLE"/>
+	<reg32 offset="0xa879" name="GPMU_ALWAYS_ON_COUNTER_LO"/>
+	<reg32 offset="0xa87a" name="GPMU_ALWAYS_ON_COUNTER_HI"/>
+	<reg32 offset="0xa87b" name="GPMU_ALWAYS_ON_COUNTER_RESET"/>
+	<reg32 offset="0xa87c" name="GPMU_POWER_COUNTER_SELECT_0"/>
+	<reg32 offset="0xa87d" name="GPMU_POWER_COUNTER_SELECT_1"/>
+
+	<reg32 offset="0xa880" name="GPMU_GPMU_SP_CLOCK_CONTROL"/>
+	<reg32 offset="0xa881" name="GPMU_SP_POWER_CNTL"/>
+	<reg32 offset="0xa886" name="GPMU_RBCCU_CLOCK_CNTL"/>
+	<reg32 offset="0xa887" name="GPMU_RBCCU_POWER_CNTL"/>
+	<reg32 offset="0xa88b" name="GPMU_SP_PWR_CLK_STATUS">
+		<bitfield name="PWR_ON" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa88d" name="GPMU_RBCCU_PWR_CLK_STATUS">
+		<bitfield name="PWR_ON" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xa891" name="GPMU_PWR_COL_STAGGER_DELAY"/>
+	<reg32 offset="0xa892" name="GPMU_PWR_COL_INTER_FRAME_CTRL"/>
+	<reg32 offset="0xa893" name="GPMU_PWR_COL_INTER_FRAME_HYST"/>
+	<reg32 offset="0xa894" name="GPMU_PWR_COL_BINNING_CTRL"/>
+	<reg32 offset="0xa8a3" name="GPMU_CLOCK_THROTTLE_CTRL"/>
+	<reg32 offset="0xa8a8" name="GPMU_THROTTLE_UNMASK_FORCE_CTRL"/>
+	<reg32 offset="0xa8c1" name="GPMU_WFI_CONFIG"/>
+	<reg32 offset="0xa8d6" name="GPMU_RBBM_INTR_INFO"/>
+	<reg32 offset="0xa8d8" name="GPMU_CM3_SYSRESET"/>
+	<reg32 offset="0xa8e0" name="GPMU_GENERAL_0"/>
+	<reg32 offset="0xa8e1" name="GPMU_GENERAL_1"/>
+	<reg32 offset="0xac00" name="GPMU_TEMP_SENSOR_ID"/>
+	<reg32 offset="0xac01" name="GPMU_TEMP_SENSOR_CONFIG"/>
+	<reg32 offset="0xac02" name="GPMU_TEMP_VAL"/>
+	<reg32 offset="0xac03" name="GPMU_DELTA_TEMP_THRESHOLD"/>
+	<reg32 offset="0xac05" name="GPMU_TEMP_THRESHOLD_INTR_STATUS"/>
+	<reg32 offset="0xac06" name="GPMU_TEMP_THRESHOLD_INTR_EN_MASK"/>
+	<reg32 offset="0xac40" name="GPMU_LEAKAGE_TEMP_COEFF_0_1"/>
+	<reg32 offset="0xac41" name="GPMU_LEAKAGE_TEMP_COEFF_2_3"/>
+	<reg32 offset="0xac42" name="GPMU_LEAKAGE_VTG_COEFF_0_1"/>
+	<reg32 offset="0xac43" name="GPMU_LEAKAGE_VTG_COEFF_2_3"/>
+	<reg32 offset="0xac46" name="GPMU_BASE_LEAKAGE"/>
+	<reg32 offset="0xac60" name="GPMU_GPMU_VOLTAGE"/>
+	<reg32 offset="0xac61" name="GPMU_GPMU_VOLTAGE_INTR_STATUS"/>
+	<reg32 offset="0xac62" name="GPMU_GPMU_VOLTAGE_INTR_EN_MASK"/>
+	<reg32 offset="0xac80" name="GPMU_GPMU_PWR_THRESHOLD"/>
+	<reg32 offset="0xacc4" name="GPMU_GPMU_LLM_GLM_SLEEP_CTRL"/>
+	<reg32 offset="0xacc5" name="GPMU_GPMU_LLM_GLM_SLEEP_STATUS"/>
+	<reg32 offset="0xb80c" name="GDPM_CONFIG1"/>
+	<reg32 offset="0xb80d" name="GDPM_CONFIG2"/>
+	<reg32 offset="0xb80f" name="GDPM_INT_EN"/>
+	<reg32 offset="0xb811" name="GDPM_INT_MASK"/>
+	<reg32 offset="0xb9a0" name="GPMU_BEC_ENABLE"/>
+	<reg32 offset="0xc41a" name="GPU_CS_SENSOR_GENERAL_STATUS"/>
+	<reg32 offset="0xc41d" name="GPU_CS_AMP_CALIBRATION_STATUS1_0"/>
+	<reg32 offset="0xc41f" name="GPU_CS_AMP_CALIBRATION_STATUS1_2"/>
+	<reg32 offset="0xc421" name="GPU_CS_AMP_CALIBRATION_STATUS1_4"/>
+	<reg32 offset="0xc520" name="GPU_CS_ENABLE_REG"/>
+	<reg32 offset="0xc557" name="GPU_CS_AMP_CALIBRATION_CONTROL1"/>
+
+
+	<reg32 offset="0xe000" name="GRAS_CL_CNTL">
+		<bitfield name="ZERO_GB_SCALE_Z" pos="6" type="boolean"/>
+	</reg32>
+	<bitset name="a5xx_gras_xs_cl_cntl" inline="yes">
+		<bitfield name="CLIP_MASK" low="0" high="7"/>
+		<bitfield name="CULL_MASK" low="8" high="15"/>
+	</bitset>
+	<reg32 offset="0xe001" name="GRAS_VS_CL_CNTL" type="a5xx_gras_xs_cl_cntl"/>
+	<reg32 offset="0xe004" name="UNKNOWN_E004"/> <!-- always 00000000? -->
+	<reg32 offset="0xe005" name="GRAS_CNTL">
+		<!-- see also RB_RENDER_CONTROL0 -->
+		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
+		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
+		<bitfield name="IJ_PERSP_SAMPLE" pos="2" type="boolean"/>
+		<bitfield name="IJ_LINEAR_PIXEL" pos="3" type="boolean"/>
+		<bitfield name="IJ_LINEAR_CENTROID" pos="4" type="boolean"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" pos="5" type="boolean"/>
+		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
+	</reg32>
+	<reg32 offset="0xe006" name="GRAS_CL_GUARDBAND_CLIP_ADJ">
+		<bitfield name="HORZ" low="0" high="9" type="uint"/>
+		<bitfield name="VERT" low="10" high="19" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe010" name="GRAS_CL_VPORT_XOFFSET_0" type="float"/>
+	<reg32 offset="0xe011" name="GRAS_CL_VPORT_XSCALE_0" type="float"/>
+	<reg32 offset="0xe012" name="GRAS_CL_VPORT_YOFFSET_0" type="float"/>
+	<reg32 offset="0xe013" name="GRAS_CL_VPORT_YSCALE_0" type="float"/>
+	<reg32 offset="0xe014" name="GRAS_CL_VPORT_ZOFFSET_0" type="float"/>
+	<reg32 offset="0xe015" name="GRAS_CL_VPORT_ZSCALE_0" type="float"/>
+	<reg32 offset="0xe090" name="GRAS_SU_CNTL">
+		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
+		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
+		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
+		<bitfield name="LINEHALFWIDTH" low="3" high="10" radix="2" type="fixed"/>
+		<bitfield name="POLY_OFFSET" pos="11" type="boolean"/>
+		<bitfield name="LINE_MODE" pos="13" type="a5xx_line_mode"/>
+		<!-- probably LINEHALFWIDTH is the same as a4xx.. -->
+	</reg32>
+	<reg32 offset="0xe091" name="GRAS_SU_POINT_MINMAX">
+		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0xe092" name="GRAS_SU_POINT_SIZE" type="fixed" radix="4"/>
+	<reg32 offset="0xe093" name="GRAS_SU_LAYERED"/>
+	<reg32 offset="0xe094" name="GRAS_SU_DEPTH_PLANE_CNTL">
+		<bitfield name="FRAG_WRITES_Z" pos="0" type="boolean"/>
+		<bitfield name="UNK1" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float"/>
+	<reg32 offset="0xe096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float"/>
+	<reg32 offset="0xe097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float"/>
+	<!-- duplicates RB_DEPTH_INFO0: -->
+	<reg32 offset="0xe098" name="GRAS_SU_DEPTH_BUFFER_INFO">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a5xx_depth_format"/>
+	</reg32>
+	<reg32 offset="0xe099" name="GRAS_SU_CONSERVATIVE_RAS_CNTL"/> <!-- always 00000000? -->
+	<!--
+	guessing about window/screen/extent, I think they can in the end be
+	used interchangeably?
+	 -->
+	<reg32 offset="0xe0a0" name="GRAS_SC_CNTL">
+		<bitfield name="BINNING_PASS" pos="0" type="boolean"/>
+		<bitfield name="SAMPLES_PASSED" pos="15" type="boolean"/>
+	</reg32>
+	<!-- note, 0x4 for binning pass when frag writes z?? -->
+	<reg32 offset="0xe0a1" name="GRAS_SC_BIN_CNTL"/> <!-- always 00000000? -->
+	<reg32 offset="0xe0a2" name="GRAS_SC_RAS_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+	</reg32>
+	<reg32 offset="0xe0a3" name="GRAS_SC_DEST_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe0a4" name="GRAS_SC_SCREEN_SCISSOR_CNTL"/> <!-- always 00000000? -->
+	<reg32 offset="0xe0aa" name="GRAS_SC_SCREEN_SCISSOR_TL_0" type="adreno_reg_xy"/>
+	<reg32 offset="0xe0ab" name="GRAS_SC_SCREEN_SCISSOR_BR_0" type="adreno_reg_xy"/>
+	<reg32 offset="0xe0ca" name="GRAS_SC_VIEWPORT_SCISSOR_TL_0" type="adreno_reg_xy"/>
+	<reg32 offset="0xe0cb" name="GRAS_SC_VIEWPORT_SCISSOR_BR_0" type="adreno_reg_xy"/>
+	<reg32 offset="0xe0ea" name="GRAS_SC_WINDOW_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0xe0eb" name="GRAS_SC_WINDOW_SCISSOR_BR" type="adreno_reg_xy"/>
+
+	<doc>
+		LRZ:  (Low Resolution Z ??)
+		----
+
+		I think it serves two functions, early discard of primitives in binning
+		pass without needing full resolution depth buffer, and also functions as
+		a depth-prepass, used during the GMEM draws to discard primitives that
+		would not be visible due to later draws.
+
+		The LRZ buffer always seems to be z16 format, regardless of actual
+		depth buffer format.
+
+		Note that LRZ write should be disabled when blend/stencil/etc is enabled,
+		since the occluded primitive can still contribute to final color value
+		of a fragment.
+
+		Only enabled for GL_LESS/GL_LEQUAL/GL_GREATER/GL_GEQUAL?
+	</doc>
+	<reg32 offset="0xe100" name="GRAS_LRZ_CNTL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+		<doc>LRZ write also disabled for blend/etc.</doc>
+		<bitfield name="LRZ_WRITE" pos="1" type="boolean"/>
+		<doc>update MAX instead of MIN value, ie. GL_GREATER/GL_GEQUAL</doc>
+		<bitfield name="GREATER" pos="2" type="boolean"/>
+		<!--
+		b3 set sometimes, when depth buffer isn't cleared.. maybe it
+		invalidates the LRZ buffer?  (Or just the covered positions?
+		 -->
+	</reg32>
+	<reg32 offset="0xe101" name="GRAS_LRZ_BUFFER_BASE_LO"/>
+	<reg32 offset="0xe102" name="GRAS_LRZ_BUFFER_BASE_HI"/>
+	<!--
+	lzr pitch is depth pitch (in pixels) / 8 (aligned to 32)..
+	 -->
+	<doc>
+		Pitch is depth width (in pixels) / 8 (aligned to 32).  Height
+		is also divided by 8 (ie. covers 8x8 pixels)
+	</doc>
+	<reg32 offset="0xe103" name="GRAS_LRZ_BUFFER_PITCH" shr="5" type="uint"/>
+	<reg32 offset="0xe104" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE_LO"/>
+	<reg32 offset="0xe105" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE_HI"/>
+
+	<reg32 offset="0xe140" name="RB_CNTL">
+		<bitfield name="WIDTH" low="0" high="7" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="9" high="16" shr="5" type="uint"/>
+		<bitfield name="BYPASS" pos="17" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe141" name="RB_RENDER_CNTL">
+<!--
+bit 3 set for normal draws
+bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
+	for z32 with no stencil, but maybe in that case separate z/s not used?
+	see mrt-fbo-* zs=2)
+ -->
+		<bitfield name="BINNING_PASS" pos="0" type="boolean"/>
+		<bitfield name="SAMPLES_PASSED" pos="6" type="boolean"/>
+		<bitfield name="DISABLE_COLOR_PIPE" pos="7" type="boolean"/>
+		<!-- why everything twice?? maybe read vs write? -->
+		<!-- UBWC flag buffer enabled for depth/stencil: -->
+		<bitfield name="FLAG_DEPTH" pos="14" type="boolean"/>
+		<bitfield name="FLAG_DEPTH2" pos="15" type="boolean"/>
+		<!-- bitmask of MRTs using UBWC flag buffer: -->
+		<bitfield name="FLAG_MRTS" low="16" high="23"/>
+		<bitfield name="FLAG_MRTS2" low="24" high="31"/>
+	</reg32>
+	<reg32 offset="0xe142" name="RB_RAS_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+	</reg32>
+	<reg32 offset="0xe143" name="RB_DEST_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+	<!--
+	note: maybe not actually called RB_RENDER_CONTROLn (since RB_RENDER_CNTL
+	name comes from kernel and is probably right)
+	 -->
+	<reg32 offset="0xe144" name="RB_RENDER_CONTROL0">
+		<!-- see also GRAS_CNTL -->
+		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
+		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
+		<bitfield name="IJ_PERSP_SAMPLE" pos="2" type="boolean"/>
+		<bitfield name="IJ_LINEAR_PIXEL" pos="3" type="boolean"/>
+		<bitfield name="IJ_LINEAR_CENTROID" pos="4" type="boolean"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" pos="5" type="boolean"/>
+		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
+	</reg32>
+	<reg32 offset="0xe145" name="RB_RENDER_CONTROL1">
+		<bitfield name="SAMPLEMASK" pos="0" type="boolean"/>
+		<bitfield name="FACENESS" pos="1" type="boolean"/>
+		<bitfield name="SAMPLEID" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe146" name="RB_FS_OUTPUT_CNTL">
+		<!-- bit0 set except for binning pass.. -->
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+		<bitfield name="FRAG_WRITES_Z" pos="5" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe147" name="RB_RENDER_COMPONENTS">
+		<bitfield name="RT0" low="0" high="3"/>
+		<bitfield name="RT1" low="4" high="7"/>
+		<bitfield name="RT2" low="8" high="11"/>
+		<bitfield name="RT3" low="12" high="15"/>
+		<bitfield name="RT4" low="16" high="19"/>
+		<bitfield name="RT5" low="20" high="23"/>
+		<bitfield name="RT6" low="24" high="27"/>
+		<bitfield name="RT7" low="28" high="31"/>
+	</reg32>
+	<array offset="0xe150" name="RB_MRT" stride="7" length="8">
+		<reg32 offset="0x0" name="CONTROL">
+			<bitfield name="BLEND" pos="0" type="boolean"/>
+			<bitfield name="BLEND2" pos="1" type="boolean"/>
+			<bitfield name="ROP_ENABLE" pos="2" type="boolean"/>
+			<bitfield name="ROP_CODE" low="3" high="6" type="a3xx_rop_code"/>
+			<bitfield name="COMPONENT_ENABLE" low="7" high="10" type="hex"/>
+		</reg32>
+		<reg32 offset="0x1" name="BLEND_CONTROL">
+			<bitfield name="RGB_SRC_FACTOR" low="0" high="4" type="adreno_rb_blend_factor"/>
+			<bitfield name="RGB_BLEND_OPCODE" low="5" high="7" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="RGB_DEST_FACTOR" low="8" high="12" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_SRC_FACTOR" low="16" high="20" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_BLEND_OPCODE" low="21" high="23" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="ALPHA_DEST_FACTOR" low="24" high="28" type="adreno_rb_blend_factor"/>
+		</reg32>
+		<reg32 offset="0x2" name="BUF_INFO">
+			<!--
+			not sure if there is a separate COLOR_SWAP field like on a3xx/a4xx,
+			or if it is inherent in the format.  Will have to play with bits
+			once we get things working and see what happens.  If it is a diff
+			field, it doesn't seem to have the same encoding as a3xx/a4xx.
+			 -->
+			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a5xx_color_fmt"/>
+			<bitfield name="COLOR_TILE_MODE" low="8" high="9" type="a5xx_tile_mode"/>
+			<bitfield name="DITHER_MODE" low="11" high="12" type="adreno_rb_dither_mode"/>
+			<bitfield name="COLOR_SWAP" low="13" high="14" type="a3xx_color_swap"/>
+			<bitfield name="COLOR_SRGB" pos="15" type="boolean"/>
+		</reg32>
+		<!--
+		at least in gmem, things seem to be aligned to pitch of 64..
+		maybe an artifact of tiled format used in gmem?
+		 -->
+		<reg32 offset="0x3" name="PITCH" shr="6" type="uint"/>
+		<reg32 offset="0x4" name="ARRAY_PITCH" shr="6" type="uint"/>
+		<reg32 offset="0x5" name="BASE_LO"/>
+		<reg32 offset="0x6" name="BASE_HI"/>
+	</array>
+	<reg32 offset="0xe1a0" name="RB_BLEND_RED">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0xe1a1" name="RB_BLEND_RED_F32" type="float"/>
+	<reg32 offset="0xe1a2" name="RB_BLEND_GREEN">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0xe1a3" name="RB_BLEND_GREEN_F32" type="float"/>
+	<reg32 offset="0xe1a4" name="RB_BLEND_BLUE">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0xe1a5" name="RB_BLEND_BLUE_F32" type="float"/>
+	<reg32 offset="0xe1a6" name="RB_BLEND_ALPHA">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0xe1a7" name="RB_BLEND_ALPHA_F32" type="float"/>
+	<reg32 offset="0xe1a8" name="RB_ALPHA_CONTROL">
+		<bitfield name="ALPHA_REF" low="0" high="7" type="hex"/>
+		<bitfield name="ALPHA_TEST" pos="8" type="boolean"/>
+		<bitfield name="ALPHA_TEST_FUNC" low="9" high="11" type="adreno_compare_func"/>
+	</reg32>
+	<reg32 offset="0xe1a9" name="RB_BLEND_CNTL">
+		<!-- per-mrt enable bit -->
+		<bitfield name="ENABLE_BLEND" low="0" high="7"/>
+		<bitfield name="INDEPENDENT_BLEND" pos="8" type="boolean"/>
+		<bitfield name="ALPHA_TO_COVERAGE" pos="10" type="boolean"/>
+		<!-- a guess? -->
+		<bitfield name="SAMPLE_MASK" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0xe1b0" name="RB_DEPTH_PLANE_CNTL">
+		<bitfield name="FRAG_WRITES_Z" pos="0" type="boolean"/>
+		<bitfield name="UNK1" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe1b1" name="RB_DEPTH_CNTL">
+		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="Z_WRITE_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="ZFUNC" low="2" high="4" type="adreno_compare_func"/>
+		<doc>Z_READ_ENABLE bit is set for zfunc other than GL_ALWAYS or GL_NEVER</doc>
+		<bitfield name="Z_READ_ENABLE" pos="6" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe1b2" name="RB_DEPTH_BUFFER_INFO">
+		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a5xx_depth_format"/>
+	</reg32>
+	<reg32 offset="0xe1b3" name="RB_DEPTH_BUFFER_BASE_LO"/>
+	<reg32 offset="0xe1b4" name="RB_DEPTH_BUFFER_BASE_HI"/>
+	<reg32 offset="0xe1b5" name="RB_DEPTH_BUFFER_PITCH" shr="6" type="uint">
+		<doc>stride of depth/stencil buffer</doc>
+	</reg32>
+	<reg32 offset="0xe1b6" name="RB_DEPTH_BUFFER_ARRAY_PITCH" shr="6" type="uint">
+		<doc>size of layer</doc>
+	</reg32>
+	<reg32 offset="0xe1c0" name="RB_STENCIL_CONTROL">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="STENCIL_ENABLE_BF" pos="1" type="boolean"/>
+		<!--
+			set for stencil operations that require read from stencil
+			buffer, but not for example for stencil clear (which does
+			not require read).. so guessing this is analogous to
+			READ_DEST_ENABLE for color buffer..
+		 -->
+		<bitfield name="STENCIL_READ" pos="2" type="boolean"/>
+		<bitfield name="FUNC" low="8" high="10" type="adreno_compare_func"/>
+		<bitfield name="FAIL" low="11" high="13" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS" low="14" high="16" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL" low="17" high="19" type="adreno_stencil_op"/>
+		<bitfield name="FUNC_BF" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="FAIL_BF" low="23" high="25" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
+	</reg32>
+	<reg32 offset="0xe1c1" name="RB_STENCIL_INFO">
+		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe1c2" name="RB_STENCIL_BASE_LO"/>
+	<reg32 offset="0xe1c3" name="RB_STENCIL_BASE_HI"/>
+	<reg32 offset="0xe1c4" name="RB_STENCIL_PITCH" shr="6" type="uint"/>
+	<reg32 offset="0xe1c5" name="RB_STENCIL_ARRAY_PITCH" shr="6" type="uint"/>
+	<reg32 offset="0xe1c6" name="RB_STENCILREFMASK" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0xe1c7" name="RB_STENCILREFMASK_BF" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0xe1d0" name="RB_WINDOW_OFFSET" type="adreno_reg_xy"/>
+	<reg32 offset="0xe1d1" name="RB_SAMPLE_COUNT_CONTROL">
+		<bitfield name="COPY" pos="1" type="boolean"/>
+	</reg32>
+
+	<doc>
+		Blits:
+		------
+
+		Blits are triggered by CP_EVENT_WRITE:BLIT, compared to previous
+		generations where they shared most of the gl pipeline and were
+		triggered by CP_DRAW_INDX*
+
+		For gmem->mem blob uses RB_BLIT_CNTL.BUF to specify src of
+		blit (ie MRTn, ZS, etc) and RB_BLIT_DST_LO/HI for destination
+		gpuaddr.  The gmem offset is taken from RB_MRT[n].BASE_LO/HI
+
+		For mem->gmem blob uses just MRT0 or ZS and RB_BLIT_DST_LO/HI
+		for the GMEM offset, and gpuaddr from RB_MRT[0].BASE_LO/HI
+		(I suppose this is just to avoid trashing RB_MRT[1..7]??)
+	</doc>
+	<reg32 offset="0xe210" name="RB_BLIT_CNTL">
+		<bitfield name="BUF" low="0" high="3" type="a5xx_blit_buf"/>
+	</reg32>
+	<reg32 offset="0xe211" name="RB_RESOLVE_CNTL_1" type="adreno_reg_xy"/>
+	<reg32 offset="0xe212" name="RB_RESOLVE_CNTL_2" type="adreno_reg_xy"/>
+	<reg32 offset="0xe213" name="RB_RESOLVE_CNTL_3">
+		<!-- if b0 set, output is in TILE5_3 format -->
+		<bitfield name="TILED" pos="0" type="boolean"/>
+	<!--
+		0xe213:
+		        0x0 mem->gmem
+		        0xf gmem->mem with flag buffer (color)
+		        0x4 gmem->mem without flag buffer (color)
+		        0x7 BYPASS mode flag buffer result (ie. on readpix)
+		            also for gmem->mem preserving tiling
+	-->
+	</reg32>
+	<reg32 offset="0xe214" name="RB_BLIT_DST_LO"/>
+	<reg32 offset="0xe215" name="RB_BLIT_DST_HI"/>
+	<reg32 offset="0xe216" name="RB_BLIT_DST_PITCH" shr="6" type="uint"/>
+	<!-- array-pitch is size of layer -->
+	<reg32 offset="0xe217" name="RB_BLIT_DST_ARRAY_PITCH" shr="6" type="uint"/>
+	<reg32 offset="0xe218" name="RB_CLEAR_COLOR_DW0"/>
+	<reg32 offset="0xe219" name="RB_CLEAR_COLOR_DW1"/>
+	<reg32 offset="0xe21a" name="RB_CLEAR_COLOR_DW2"/>
+	<reg32 offset="0xe21b" name="RB_CLEAR_COLOR_DW3"/>
+	<reg32 offset="0xe21c" name="RB_CLEAR_CNTL">
+		<bitfield name="FAST_CLEAR" pos="1" type="boolean"/>
+		<bitfield name="MSAA_RESOLVE" pos="2" type="boolean"/>
+		<doc>
+			For MASK, if RB_BLIT_CNTL.BUF=BLIT_ZS:
+				1 - depth
+				2 - stencil
+				3 - depth+stencil
+			if RB_BLIT_CNTL.BUF=BLIT_MRTn
+				then probably a component mask, I always see 0xf
+		</doc>
+		<bitfield name="MASK" low="4" high="7"/>
+	</reg32>
+
+	<doc>
+		Buffer Metadata (flag buffers):
+		-------------------------------
+
+		Blob seems to stick some metadata at the front of the buffer,
+		both z/s and MRT.  I think this is same as UBWC (bandwidth
+		compression) metadata that mdp 1.7 and later supports.  See
+		1d3fae5698ce5358caab87a15383b690941697e8 in downstream kernel.
+		UBWC seems to stand for "universal bandwidth compression".
+
+		Before glReadPixels() it does a pair of BYPASS blits (at least
+		if metadata is used) presumably to resolve metadata.
+
+		NOTES: see: getUBwcBlockSize(), getUBwcMetaBufferSize() at
+		https://android.googlesource.com/platform/hardware/qcom/display/+/android-6.0.1_r40/msm8994/libgralloc/alloc_controller.cpp
+		(note that bpp in bytes, not bits, so really cpp)
+
+		Example Layout 2d w/ mipmap levels:
+
+			100x2000, ifmt=GL_RG, fmt=GL_RG16F, type=GL_FLOAT, meta=64x512@0x8000 (7x500)
+				base=c072e000, offset=16384, size=1703936
+
+				color		flags
+			0	c073a000	c0732000	- level 0 flags is address
+			1	c0838000	c0834000	  programmed in texture state
+			2	c0879000	c0877000
+			3	c089a000	c0899000
+			4	c08ab000	c08aa000
+			5	c08b4000	c08b3000
+			6	c08b9000	c08b8000
+			7	c08bc000	c08bb000
+			8	c08be000	c08bd000
+			9	c08c0000	c08bf000
+			10	c08c2000	c08c1000
+
+		ARRAY_PITCH is the combined size of all the levels plus flags,
+		so 0xc08c3000 - 0xc0732000 = 0x00191000 (1642496); each level
+		takes up a minimum of 2 pages (since color and flags parts are
+		each page aligned.
+
+			{ TILE_MODE = TILE5_3 | SWIZ_X = A5XX_TEX_X | SWIZ_Y = A5XX_TEX_Y | SWIZ_Z = A5XX_TEX_ZERO | SWIZ_W = A5XX_TEX_ONE | MIPLVLS = 0 | FMT = TFMT5_16_16_FLOAT | SWAP = WZYX }
+			{ WIDTH = 100 | HEIGHT = 2000 }
+			{ FETCHSIZE = TFETCH5_4_BYTE | PITCH = 512 | TYPE = A5XX_TEX_2D }
+			{ ARRAY_PITCH = 1642496 | 0x18800000 }  - NOTE c2dc always has 0x18800000 but
+			{ BASE_LO = 0xc0732000 }                  this varies for blob gles driver..
+			{ BASE_HI = 0 | DEPTH = 1 }               not sure what it is
+
+
+	</doc>
+	<reg32 offset="0xe240" name="RB_DEPTH_FLAG_BUFFER_BASE_LO"/>
+	<reg32 offset="0xe241" name="RB_DEPTH_FLAG_BUFFER_BASE_HI"/>
+	<reg32 offset="0xe242" name="RB_DEPTH_FLAG_BUFFER_PITCH">
+	</reg32>
+	<array offset="0xe243" name="RB_MRT_FLAG_BUFFER" stride="4" length="8">
+		<reg32 offset="0" name="ADDR_LO"/>
+		<reg32 offset="1" name="ADDR_HI"/>
+		<reg32 offset="2" name="PITCH" shr="6" type="uint"/>
+		<!-- array-pitch is size of layer -->
+		<reg32 offset="3" name="ARRAY_PITCH" shr="6" type="uint"/>
+	</array>
+	<reg32 offset="0xe263" name="RB_BLIT_FLAG_DST_LO"/>
+	<reg32 offset="0xe264" name="RB_BLIT_FLAG_DST_HI"/>
+	<reg32 offset="0xe265" name="RB_BLIT_FLAG_DST_PITCH" shr="6" type="uint"/>
+	<!-- array-pitch is size of layer -->
+	<reg32 offset="0xe266" name="RB_BLIT_FLAG_DST_ARRAY_PITCH" shr="6" type="uint"/>
+
+	<reg32 offset="0xe267" name="RB_SAMPLE_COUNT_ADDR_LO"/>
+	<reg32 offset="0xe268" name="RB_SAMPLE_COUNT_ADDR_HI"/>
+
+	<reg32 offset="0xe280" name="VPC_CNTL_0">
+		<doc>
+			num of varyings plus four for gl_Position (plus one if gl_PointSize)
+			plus # of transform-feedback (streamout) varyings if using the
+			hw streamout (rather than stg instructions in shader)
+		</doc>
+		<bitfield name="STRIDE_IN_VPC" low="0" high="6" type="uint"/>
+		<bitfield name="VARYING" pos="11" type="boolean"/>
+	</reg32>
+	<array offset="0xe282" name="VPC_VARYING_INTERP" stride="1" length="8">
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+	<array offset="0xe28a" name="VPC_VARYING_PS_REPL" stride="1" length="8">
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+	<reg32 offset="0xe292" name="UNKNOWN_E292"/>
+	<reg32 offset="0xe293" name="UNKNOWN_E293"/>
+	<array offset="0xe294" name="VPC_VAR" stride="1" length="4">
+		<!-- one bit per varying component: -->
+		<reg32 offset="0" name="DISABLE"/>
+	</array>
+	<reg32 offset="0xe298" name="VPC_GS_SIV_CNTL"/>
+	<reg32 offset="0xe29a" name="VPC_CLIP_CNTL">
+		<bitfield name="CLIP_MASK" low="0" high="7" type="uint"/>
+		<!-- there can be up to 8 total clip/cull distance outputs,
+		     but apparenly VPC can only deal with vec4, so when there are
+		     more than 4 outputs a second location needs to be programmed
+		-->
+		<bitfield name="CLIP_DIST_03_LOC" low="8" high="15" type="uint"/>
+		<bitfield name="CLIP_DIST_47_LOC" low="16" high="23" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0xe29d" name="VPC_PACK">
+		<bitfield name="NUMNONPOSVAR" low="0" high="7" type="uint"/>
+		<!--
+		This seems to be the OUTLOC for the psize output.  It could possibly
+		be the max-OUTLOC position, but it is only set when VS writes psize
+		(and blob always puts psize at highest OUTLOC)
+		 -->
+		<bitfield name="PSIZELOC" low="8" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe2a0" name="VPC_FS_PRIMITIVEID_CNTL"/>
+
+	<doc>
+		Stream-Out:
+		-----------
+
+		VPC_SO[0..3] registers setup details about streamout buffers, and
+		number of components to write to each.
+
+		VPC_SO_PROG provides the mapping between output varyings and the SO
+		buffers.  It is written multiple times (via a CP_CONTEXT_REG_BUNCH
+		packet, not sure if that matters), each write can handle up to two
+		components of stream-out output.  Order matches up to OUTLOC,
+		including padding.  So, if outputting first 3 varyings:
+
+			SP_VS_OUT[0].REG: { A_REGID = r0.w | A_COMPMASK = 0xf | B_REGID = r0.x | B_COMPMASK = 0x7 }
+			SP_VS_OUT[0x1].REG: { A_REGID = r1.w | A_COMPMASK = 0x3 | B_REGID = r2.y | B_COMPMASK = 0xf }
+			SP_VS_VPC_DST[0].REG: { OUTLOC0 = 0 | OUTLOC1 = 4 | OUTLOC2 = 8 | OUTLOC3 = 12 }
+
+		Then:
+
+			VPC_SO_PROG: { A_BUF = 0 | A_OFF = 0 | A_EN | A_BUF = 0 | B_OFF = 4 | B_EN }
+			VPC_SO_PROG: { A_BUF = 0 | A_OFF = 8 | A_EN | A_BUF = 0 | B_OFF = 12 | B_EN }
+			VPC_SO_PROG: { A_BUF = 2 | A_OFF = 0 | A_EN | A_BUF = 2 | B_OFF = 4 | B_EN }
+			VPC_SO_PROG: { A_BUF = 2 | A_OFF = 8 | A_EN | A_BUF = 0 | B_OFF = 0 }
+			VPC_SO_PROG: { A_BUF = 1 | A_OFF = 0 | A_EN | A_BUF = 1 | B_OFF = 4 | B_EN }
+
+		Note that varying order is OUTLOC0, OUTLOC2, OUTLOC1, and note
+		the padding between OUTLOC1 and OUTLOC2.
+
+		The BUF bitfield indicates which of the four streamout buffers
+		to write into at the specified offset.
+
+		The VPC_SO[n].FLUSH_BASE_LO/HI is used for hw to write back next
+		offset which gets loaded back into VPC_SO[n].BUFFER_OFFSET via a
+		CP_MEM_TO_REG.  Probably can be ignored until we have GS/etc, at
+		which point we can't calculate the offset on the CPU.
+	</doc>
+	<reg32 offset="0xe2a1" name="VPC_SO_BUF_CNTL">
+		<bitfield name="BUF0" pos="0" type="boolean"/>
+		<bitfield name="BUF1" pos="3" type="boolean"/>
+		<bitfield name="BUF2" pos="6" type="boolean"/>
+		<bitfield name="BUF3" pos="9" type="boolean"/>
+		<bitfield name="ENABLE" pos="15" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe2a2" name="VPC_SO_OVERRIDE">
+		<bitfield name="SO_DISABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe2a3" name="VPC_SO_CNTL">
+		<!-- always 0x10000 when SO enabled.. -->
+		<bitfield name="ENABLE" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe2a4" name="VPC_SO_PROG">
+		<bitfield name="A_BUF" low="0" high="1" type="uint"/>
+		<bitfield name="A_OFF" low="2" high="10" shr="2" type="uint"/>
+		<bitfield name="A_EN" pos="11" type="boolean"/>
+		<bitfield name="B_BUF" low="12" high="13" type="uint"/>
+		<bitfield name="B_OFF" low="14" high="22" shr="2" type="uint"/>
+		<bitfield name="B_EN" pos="23" type="boolean"/>
+	</reg32>
+	<array offset="0xe2a7" name="VPC_SO" stride="7" length="4">
+		<reg32 offset="0" name="BUFFER_BASE_LO"/>
+		<reg32 offset="1" name="BUFFER_BASE_HI"/>
+		<reg32 offset="2" name="BUFFER_SIZE"/>
+		<reg32 offset="3" name="NCOMP"/>  <!-- component count -->
+		<reg32 offset="4" name="BUFFER_OFFSET"/>
+		<reg32 offset="5" name="FLUSH_BASE_LO"/>
+		<reg32 offset="6" name="FLUSH_BASE_HI"/>
+	</array>
+
+	<reg32 offset="0xe384" name="PC_PRIMITIVE_CNTL">
+		<!-- # of varyings plus four for gl_Position (plus one if gl_PointSize) -->
+		<bitfield name="STRIDE_IN_VPC" low="0" high="6" type="uint"/>
+		<bitfield name="PRIMITIVE_RESTART" pos="8" type="boolean"/>
+		<bitfield name="COUNT_PRIMITIVES" pos="9" type="boolean"/><!-- enabled when gl_PrimitiveIDIn is used -->
+		<bitfield name="PROVOKING_VTX_LAST" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe385" name="PC_PRIM_VTX_CNTL">
+		<bitfield name="PSIZE" pos="11" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe388" name="PC_RASTER_CNTL">
+		<bitfield name="POLYMODE_FRONT_PTYPE" low="0" high="2" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_BACK_PTYPE" low="3" high="5" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_ENABLE" pos="6" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe389" name="PC_CLIP_CNTL">
+		<bitfield name="CLIP_MASK" low="0" high="7"/>
+	</reg32>
+	<reg32 offset="0xe38c" name="PC_RESTART_INDEX"/>
+	<reg32 offset="0xe38d" name="PC_GS_LAYERED"/>
+	<reg32 offset="0xe38e" name="PC_GS_PARAM">
+		<bitfield name="MAX_VERTICES" low="0" high="9" type="uint"/><!-- vertices - 1 -->
+		<bitfield name="INVOCATIONS" low="11" high="15" type="uint"/><!-- invoc - 1 -->
+		<bitfield name="PRIMTYPE" low="23" high="24" type="adreno_pa_su_sc_draw"/>
+	</reg32>
+	<reg32 offset="0xe38f" name="PC_HS_PARAM">
+		<bitfield name="VERTICES_OUT" low="0" high="5" type="uint"/>
+		<bitfield name="SPACING" low="21" high="22" type="a4xx_tess_spacing"/>
+		<bitfield name="CW" pos="23" type="boolean"/>
+		<bitfield name="CONNECTED" pos="24" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe3b0" name="PC_POWER_CNTL"/>
+
+	<reg32 offset="0xe400" name="VFD_CONTROL_0">
+		<bitfield name="VTXCNT" low="0" high="5" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe401" name="VFD_CONTROL_1">
+		<bitfield name="REGID4VTX" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="REGID4INST" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID4PRIMID" low="16" high="23" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xe402" name="VFD_CONTROL_2">
+		<bitfield name="REGID_PATCHID" low="0" high="7" type="a3xx_regid"/><!-- same as VFD_CONTROL_3.REGID_PATCHID? -->
+	</reg32>
+	<reg32 offset="0xe403" name="VFD_CONTROL_3">
+		<bitfield name="REGID_PATCHID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSX" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSY" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xe404" name="VFD_CONTROL_4">
+	</reg32>
+	<reg32 offset="0xe405" name="VFD_CONTROL_5">
+		<!-- b0 set if gl_PrimitiveID used in fs ?? -->
+	</reg32>
+	<reg32 offset="0xe408" name="VFD_INDEX_OFFSET"/>
+	<reg32 offset="0xe409" name="VFD_INSTANCE_START_OFFSET"/>
+	<array offset="0xe40a" name="VFD_FETCH" stride="4" length="32">
+		<reg32 offset="0x0" name="BASE_LO"/>
+		<reg32 offset="0x1" name="BASE_HI"/>
+		<reg32 offset="0x2" name="SIZE" type="uint"/>
+		<reg32 offset="0x3" name="STRIDE" type="uint"/>
+	</array>
+	<array offset="0xe48a" name="VFD_DECODE" stride="2" length="32">
+		<reg32 offset="0x0" name="INSTR">
+			<!-- IDX appears to index into VFD_FETCH[] -->
+			<bitfield name="IDX" low="0" high="4" type="uint"/>
+			<bitfield name="INSTANCED" pos="17" type="boolean"/>
+			<bitfield name="FORMAT" low="20" high="27" type="a5xx_vtx_fmt"/>
+			<bitfield name="SWAP" low="28" high="29" type="a3xx_color_swap"/>
+			<bitfield name="UNK30" pos="30" type="boolean"/>
+			<bitfield name="FLOAT" pos="31" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x1" name="STEP_RATE"/> <!-- ??? -->
+	</array>
+	<array offset="0xe4ca" name="VFD_DEST_CNTL" stride="1" length="32">
+		<reg32 offset="0x0" name="INSTR">
+			<bitfield name="WRITEMASK" low="0" high="3" type="hex"/>
+			<bitfield name="REGID" low="4" high="11" type="a3xx_regid"/>
+		</reg32>
+	</array>
+	<reg32 offset="0xe4f0" name="VFD_POWER_CNTL"/>
+
+	<!-- 0x0 for compute, 0x10 for 3d? -->
+	<reg32 offset="0xe580" name="SP_SP_CNTL"/>
+
+	<bitset name="a5xx_xs_config" inline="yes">
+		<bitfield name="ENABLED" pos="0" type="boolean"/>
+		<bitfield name="CONSTOBJECTOFFSET" low="1" high="7" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="8" high="14" type="uint"/>
+	</bitset>
+	<bitset name="a5xx_xs_cntl" inline="yes">
+		<bitfield name="SSBO_ENABLE" pos="0" type="boolean"/>
+		<!--
+		no idea high bit.. could be this is amount of on-chip memory used
+		rather than total size?
+		 -->
+		<bitfield name="INSTRLEN" low="1" high="31" type="uint"/>
+	</bitset>
+	<bitset name="a5xx_sp_xs_ctrl_reg0" inline="yes">
+		<!-- bit1 almost always set -->
+		<!-- set for "buffer mode" (ie. shader small enough to fit internally) -->
+		<bitfield name="BUFFER" pos="2" type="boolean"/>
+		<!-- 24 or more (full size) GPRS and blob uses TWO_QUADS instead of FOUR_QUADS -->
+		<bitfield name="THREADSIZE" pos="3" type="a3xx_threadsize"/>
+		<bitfield name="HALFREGFOOTPRINT" low="4" high="9" type="uint"/>
+		<bitfield name="FULLREGFOOTPRINT" low="10" high="15" type="uint"/>
+		<bitfield name="VARYING" pos="16" type="boolean"/>
+		<bitfield name="PIXLODENABLE" pos="20" type="boolean"/>
+		<!-- seems to be nesting level for flow control:.. -->
+		<bitfield name="BRANCHSTACK" low="25" high="31" type="uint"/>
+	</bitset>
+	<!-- assuming things appear in same relative order as a4xx: -->
+	<!-- duplicated exactly w/ corresponding HLSQ_ regs starting at 0xe78b.. -->
+	<reg32 offset="0xe584" name="SP_VS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe585" name="SP_FS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe586" name="SP_HS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe587" name="SP_DS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe588" name="SP_GS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe589" name="SP_CS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe58a" name="SP_VS_CONFIG_MAX_CONST"/>
+	<reg32 offset="0xe58b" name="SP_FS_CONFIG_MAX_CONST"/>
+	<reg32 offset="0xe590" name="SP_VS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe592" name="SP_PRIMITIVE_CNTL">
+		<!-- # of VS outputs including pos/psize -->
+		<bitfield name="VSOUT" low="0" high="4" type="uint"/>
+	</reg32>
+	<array offset="0xe593" name="SP_VS_OUT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="23" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="24" high="27" type="hex"/>
+		</reg32>
+	</array>
+	<!--
+	Starting with a5xx, position/psize outputs from shader end up in the
+	SP_VS_OUT map, with highest OUTLOCn position.  (Generally they are
+	the last entries too, except when gl_PointCoord is used, blob inserts
+	an extra varying after, but with a lower OUTLOC position.  If present,
+	psize is last, preceded by position.
+	 -->
+	<array offset="0xe5a3" name="SP_VS_VPC_DST" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0xe5ab" name="UNKNOWN_E5AB"/>
+	<reg32 offset="0xe5ac" name="SP_VS_OBJ_START_LO"/>
+	<reg32 offset="0xe5ad" name="SP_VS_OBJ_START_HI"/>
+
+	<bitset name="a5xx_sp_xs_pvt_mem_param" inline="yes">
+		<bitfield name="MEMSIZEPERITEM" low="0" high="7" shr="9">
+			<doc>The size of memory that ldp/stp can address.</doc>
+		</bitfield>
+		<bitfield name="HWSTACKOFFSET" low="8" high="23" shr="11" type="uint"/>
+		<bitfield name="HWSTACKSIZEPERTHREAD" low="24" high="31">
+                        <doc>Guessing that this is the same as a3xx/a6xx.</doc>
+		</bitfield>
+	</bitset>
+
+	<bitset name="a5xx_sp_xs_pvt_mem_size" inline="yes">
+		<bitfield name="TOTALPVTMEMSIZE" low="0" high="17" shr="12"/>
+	</bitset>
+
+	<reg32 offset="0xe5ae" name="SP_VS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe5af" name="SP_VS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe5b1" name="SP_VS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+	<reg32 offset="0xe5c0" name="SP_FS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe5c2" name="UNKNOWN_E5C2"/>
+	<reg32 offset="0xe5c3" name="SP_FS_OBJ_START_LO"/>
+	<reg32 offset="0xe5c4" name="SP_FS_OBJ_START_HI"/>
+	<reg32 offset="0xe5c5" name="SP_FS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe5c6" name="SP_FS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe5c8" name="SP_FS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+	<reg32 offset="0xe5c9" name="SP_BLEND_CNTL">
+		<!-- per-mrt enable bit -->
+		<bitfield name="ENABLE_BLEND" low="0" high="7"/>
+		<bitfield name="UNK8" pos="8" type="boolean"/>
+		<bitfield name="ALPHA_TO_COVERAGE" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0xe5ca" name="SP_FS_OUTPUT_CNTL">
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+		<bitfield name="DEPTH_REGID" low="5" high="12" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK_REGID" low="13" high="20" type="a3xx_regid"/>
+	</reg32>
+	<array offset="0xe5cb" name="SP_FS_OUTPUT" stride="1" length="8">
+		<doc>per MRT</doc>
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="HALF_PRECISION" pos="8" type="boolean"/>
+		</reg32>
+	</array>
+	<array offset="0xe5d3" name="SP_FS_MRT" stride="1" length="8">
+		<reg32 offset="0" name="REG">
+			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a5xx_color_fmt"/>
+			<bitfield name="COLOR_SINT" pos="8" type="boolean"/>
+			<bitfield name="COLOR_UINT" pos="9" type="boolean"/>
+			<bitfield name="COLOR_SRGB" pos="10" type="boolean"/>
+		</reg32>
+	</array>
+	<!--
+	e5db/e5dc seems to look related to some optimization to do sample from
+	texture using varying value directly before shader thread starts?  I
+	guess that could optimize common simple frag shaders..
+	 -->
+	<reg32 offset="0xe5db" name="UNKNOWN_E5DB"/>
+	<reg32 offset="0xe5f0" name="SP_CS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe5f2" name="UNKNOWN_E5F2"/>
+	<reg32 offset="0xe5f3" name="SP_CS_OBJ_START_LO"/>
+	<reg32 offset="0xe5f4" name="SP_CS_OBJ_START_HI"/>
+	<reg32 offset="0xe5f5" name="SP_CS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe5f6" name="SP_CS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe5f8" name="SP_CS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+
+	<!-- e5f9 something compute related.. seems to change when HLSQ_CS_CNTL_1 changes -->
+
+	<reg32 offset="0xe600" name="SP_HS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe602" name="UNKNOWN_E602"/>
+	<reg32 offset="0xe603" name="SP_HS_OBJ_START_LO"/>
+	<reg32 offset="0xe604" name="SP_HS_OBJ_START_HI"/>
+	<reg32 offset="0xe605" name="SP_HS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe606" name="SP_HS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe608" name="SP_HS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+	<reg32 offset="0xe610" name="SP_DS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe62b" name="UNKNOWN_E62B"/>
+	<reg32 offset="0xe62c" name="SP_DS_OBJ_START_LO"/>
+	<reg32 offset="0xe62d" name="SP_DS_OBJ_START_HI"/>
+	<reg32 offset="0xe62e" name="SP_DS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe62f" name="SP_DS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe631" name="SP_DS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+	<reg32 offset="0xe640" name="SP_GS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
+	<reg32 offset="0xe65b" name="UNKNOWN_E65B"/>
+	<reg32 offset="0xe65c" name="SP_GS_OBJ_START_LO"/>
+	<reg32 offset="0xe65d" name="SP_GS_OBJ_START_HI"/>
+	<reg32 offset="0xe65e" name="SP_GS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
+	<reg64 offset="0xe65f" name="SP_GS_PVT_MEM_ADDR" type="waddress" align="32"/>
+	<reg32 offset="0xe661" name="SP_GS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
+
+	<reg32 offset="0xe704" name="TPL1_TP_RAS_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+	</reg32>
+	<reg32 offset="0xe705" name="TPL1_TP_DEST_MSAA_CNTL">
+		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
+	</reg32>
+	<!-- either blob is doing it wrong, or this is not per-stage anymore: -->
+	<reg32 offset="0xe706" name="TPL1_TP_BORDER_COLOR_BASE_ADDR_LO"/>
+	<reg32 offset="0xe707" name="TPL1_TP_BORDER_COLOR_BASE_ADDR_HI"/>
+
+	<!--
+	so these have the same info that is normally in the CP_LOAD_STATE
+	packets.. not sure if they are normally written by pm4/me or if the
+	CP_LOAD_STATE mechanism is deprecated?
+	 -->
+	<reg32 offset="0xe700" name="TPL1_VS_TEX_COUNT" type="uint"/>
+	<reg32 offset="0xe701" name="TPL1_HS_TEX_COUNT" type="uint"/>
+	<reg32 offset="0xe702" name="TPL1_DS_TEX_COUNT" type="uint"/>
+	<reg32 offset="0xe703" name="TPL1_GS_TEX_COUNT" type="uint"/>
+
+	<reg32 offset="0xe722" name="TPL1_VS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe723" name="TPL1_VS_TEX_SAMP_HI"/>
+	<reg32 offset="0xe724" name="TPL1_HS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe725" name="TPL1_HS_TEX_SAMP_HI"/>
+	<reg32 offset="0xe726" name="TPL1_DS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe727" name="TPL1_DS_TEX_SAMP_HI"/>
+	<reg32 offset="0xe728" name="TPL1_GS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe729" name="TPL1_GS_TEX_SAMP_HI"/>
+
+	<reg32 offset="0xe72a" name="TPL1_VS_TEX_CONST_LO"/>
+	<reg32 offset="0xe72b" name="TPL1_VS_TEX_CONST_HI"/>
+	<reg32 offset="0xe72c" name="TPL1_HS_TEX_CONST_LO"/>
+	<reg32 offset="0xe72d" name="TPL1_HS_TEX_CONST_HI"/>
+	<reg32 offset="0xe72e" name="TPL1_DS_TEX_CONST_LO"/>
+	<reg32 offset="0xe72f" name="TPL1_DS_TEX_CONST_HI"/>
+	<reg32 offset="0xe730" name="TPL1_GS_TEX_CONST_LO"/>
+	<reg32 offset="0xe731" name="TPL1_GS_TEX_CONST_HI"/>
+
+	<reg32 offset="0xe750" name="TPL1_FS_TEX_COUNT" type="uint"/>
+	<reg32 offset="0xe751" name="TPL1_CS_TEX_COUNT" type="uint"/>
+
+	<reg32 offset="0xe75a" name="TPL1_FS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe75b" name="TPL1_FS_TEX_SAMP_HI"/>
+	<reg32 offset="0xe75c" name="TPL1_CS_TEX_SAMP_LO"/>
+	<reg32 offset="0xe75d" name="TPL1_CS_TEX_SAMP_HI"/>
+	<reg32 offset="0xe75e" name="TPL1_FS_TEX_CONST_LO"/>
+	<reg32 offset="0xe75f" name="TPL1_FS_TEX_CONST_HI"/>
+	<reg32 offset="0xe760" name="TPL1_CS_TEX_CONST_LO"/>
+	<reg32 offset="0xe761" name="TPL1_CS_TEX_CONST_HI"/>
+
+	<reg32 offset="0xe764" name="TPL1_TP_FS_ROTATION_CNTL"/>
+
+	<reg32 offset="0xe784" name="HLSQ_CONTROL_0_REG">
+		<!-- 24 or more (full size) GPRS and blob uses TWO_QUADS instead of FOUR_QUADS -->
+		<bitfield name="FSTHREADSIZE" pos="0" type="a3xx_threadsize"/>
+		<bitfield name="CSTHREADSIZE" pos="2" type="a3xx_threadsize"/>
+	</reg32>
+	<reg32 offset="0xe785" name="HLSQ_CONTROL_1_REG">
+		<!-- I guess.. not set exactly same as a4xx, but similar: -->
+		<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="5" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe786" name="HLSQ_CONTROL_2_REG">
+		<bitfield name="FACEREGID" low="0" high="7" type="a3xx_regid"/>
+		<!-- SAMPLEID is loaded into a half-precision register: -->
+		<bitfield name="SAMPLEID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="CENTERRHW" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xe787" name="HLSQ_CONTROL_3_REG">
+		<!-- register loaded with position (bary.f) -->
+		<bitfield name="IJ_PERSP_PIXEL" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_PIXEL" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="IJ_PERSP_CENTROID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_CENTROID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xe788" name="HLSQ_CONTROL_4_REG">
+		<bitfield name="IJ_PERSP_SAMPLE" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="XYCOORDREGID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="ZWCOORDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<!--
+	0x020fffff for normal draws, 0x1f00000 for compute.. maybe what state
+	is enabled?  We could probably try disabling different bits and see
+	what breaks to figure out which is what:
+	 -->
+	<reg32 offset="0xe78a" name="HLSQ_UPDATE_CNTL"/>
+	<reg32 offset="0xe78b" name="HLSQ_VS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe78c" name="HLSQ_FS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe78d" name="HLSQ_HS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe78e" name="HLSQ_DS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe78f" name="HLSQ_GS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe790" name="HLSQ_CS_CONFIG" type="a5xx_xs_config"/>
+	<reg32 offset="0xe791" name="HLSQ_VS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe792" name="HLSQ_FS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe793" name="HLSQ_HS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe794" name="HLSQ_DS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe795" name="HLSQ_GS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe796" name="HLSQ_CS_CNTL" type="a5xx_xs_cntl"/>
+	<reg32 offset="0xe7b9" name="HLSQ_CS_KERNEL_GROUP_X"/>
+	<reg32 offset="0xe7ba" name="HLSQ_CS_KERNEL_GROUP_Y"/>
+	<reg32 offset="0xe7bb" name="HLSQ_CS_KERNEL_GROUP_Z"/>
+	<reg32 offset="0xe7b0" name="HLSQ_CS_NDRANGE_0">
+		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
+		<!-- localsize is value minus one: -->
+		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b1" name="HLSQ_CS_NDRANGE_1">
+		<bitfield name="GLOBALSIZE_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b2" name="HLSQ_CS_NDRANGE_2">
+		<bitfield name="GLOBALOFF_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b3" name="HLSQ_CS_NDRANGE_3">
+		<bitfield name="GLOBALSIZE_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b4" name="HLSQ_CS_NDRANGE_4">
+		<bitfield name="GLOBALOFF_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b5" name="HLSQ_CS_NDRANGE_5">
+		<bitfield name="GLOBALSIZE_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b6" name="HLSQ_CS_NDRANGE_6">
+		<bitfield name="GLOBALOFF_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0xe7b7" name="HLSQ_CS_CNTL_0">
+		<bitfield name="WGIDCONSTID" low="0" high="7" type="a3xx_regid"/>
+		<!-- possibly one of these is KERNELDIMCONSTID? -->
+		<!--
+		UNK0 appears to be NUMWGCONSTID.. but only works in certain
+		cases?  Blob doesn't appear to use it, but instead emits
+		these via const (uniform).  Which requires some shenanigans
+		for indirect draws when the offset is not strongly aligned
+		enough to use as EXT_SRC_ADDR in CP_LOAD_STATE
+		 -->
+		<bitfield name="UNK0" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="UNK1" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0xe7b8" name="HLSQ_CS_CNTL_1"/>
+	<reg32 offset="0xe7c0" name="UNKNOWN_E7C0"/>
+	<reg32 offset="0xe7c3" name="HLSQ_VS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7c4" name="HLSQ_VS_INSTRLEN" type="uint"/>
+	<reg32 offset="0xe7c5" name="UNKNOWN_E7C5"/>
+	<reg32 offset="0xe7c8" name="HLSQ_HS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7c9" name="HLSQ_HS_INSTRLEN" type="uint"/>
+	<reg32 offset="0xe7ca" name="UNKNOWN_E7CA"/>
+	<reg32 offset="0xe7cd" name="HLSQ_DS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7ce" name="HLSQ_DS_INSTRLEN" type="uint"/>
+	<reg32 offset="0xe7cf" name="UNKNOWN_E7CF"/>
+	<reg32 offset="0xe7d2" name="HLSQ_GS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7d3" name="HLSQ_GS_INSTRLEN" type="uint"/>
+	<reg32 offset="0xe7d4" name="UNKNOWN_E7D4"/>
+	<reg32 offset="0xe7d7" name="HLSQ_FS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7d8" name="HLSQ_FS_INSTRLEN" type="uint"/>
+	<reg32 offset="0xe7d9" name="UNKNOWN_E7D9"/>
+	<reg32 offset="0xe7dc" name="HLSQ_CS_CONSTLEN" type="uint"/>
+	<reg32 offset="0xe7dd" name="HLSQ_CS_INSTRLEN" type="uint"/>
+
+	<!--
+		Separate blit/2d or dma engine?  Seems to get used sometimes for
+		texture uploads, where a4xx blob would use normal draws.  Used
+		in render-mode 0x5..
+
+		Note seems mostly to be used for small blits, large blits seem
+		to use the CP_EVENT_WRITE:BLIT style of doing things.  See
+		cubemap-0003 (40x40) vs cubemap-0004 (256x256).
+
+		see cube-0000, cubemap-(1..3 but not 4+), quad-textured-10..17
+
+		Other nearby registers are probably color formats, etc.  The
+		blit coords are in CP packet.  Play more w/ glTexSubImage2D()
+		to work it out.
+
+		Separate this into a different domain??  Would that help to
+		restrict which registers we dump based on mode?
+
+		regs 0x2000 to 0x2004 (plus all-zero regs 0x2005-0x2009) look
+		like 2nd source for blending?  Used in mipmap generation.. but
+		maybe layout is a bit different.  (Possibly used for reading
+		src via sampler, to enable scaling??)  0x2040 also used in this
+		case.
+	 -->
+	<reg32 offset="0x2100" name="RB_2D_BLIT_CNTL"/>  <!-- same as 0x2180 -->
+	<reg32 offset="0x2101" name="RB_2D_SRC_SOLID_DW0"/>
+	<reg32 offset="0x2102" name="RB_2D_SRC_SOLID_DW1"/>
+	<reg32 offset="0x2103" name="RB_2D_SRC_SOLID_DW2"/>
+	<reg32 offset="0x2104" name="RB_2D_SRC_SOLID_DW3"/>
+
+	<bitset name="a5xx_2d_surf_info" inline="yes">
+		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a5xx_color_fmt"/>
+		<bitfield name="TILE_MODE" low="8" high="9" type="a5xx_tile_mode"/>
+		<bitfield name="COLOR_SWAP" low="10" high="11" type="a3xx_color_swap"/>
+		<!-- b12 seems to be set when UBWC "FLAGS" buffer enabled -->
+		<bitfield name="FLAGS" pos="12" type="boolean"/>
+		<bitfield name="SRGB" pos="13" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x2107" name="RB_2D_SRC_INFO" type="a5xx_2d_surf_info"/>
+	<reg32 offset="0x2108" name="RB_2D_SRC_LO"/>
+	<reg32 offset="0x2109" name="RB_2D_SRC_HI"/>
+	<reg32 offset="0x210a" name="RB_2D_SRC_SIZE">
+		<bitfield name="PITCH" low="0" high="15" shr="6" type="uint"/>
+		<bitfield name="ARRAY_PITCH" low="16" high="31" shr="6" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x2110" name="RB_2D_DST_INFO" type="a5xx_2d_surf_info"/>
+	<reg32 offset="0x2111" name="RB_2D_DST_LO"/>
+	<reg32 offset="0x2112" name="RB_2D_DST_HI"/>
+	<reg32 offset="0x2113" name="RB_2D_DST_SIZE">
+		<bitfield name="PITCH" low="0" high="15" shr="6" type="uint"/>
+		<bitfield name="ARRAY_PITCH" low="16" high="31" shr="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2140" name="RB_2D_SRC_FLAGS_LO"/>
+	<reg32 offset="0x2141" name="RB_2D_SRC_FLAGS_HI"/>
+        <reg32 offset="0x2142" name="RB_2D_SRC_FLAGS_PITCH" shr="6" type="uint"/>
+	<reg32 offset="0x2143" name="RB_2D_DST_FLAGS_LO"/>
+	<reg32 offset="0x2144" name="RB_2D_DST_FLAGS_HI"/>
+        <reg32 offset="0x2145" name="RB_2D_DST_FLAGS_PITCH" shr="6" type="uint"/>
+	<reg32 offset="0x2180" name="GRAS_2D_BLIT_CNTL"/> <!-- same as 0x2100 -->
+	<!-- looks same as 0x2107: -->
+	<reg32 offset="0x2181" name="GRAS_2D_SRC_INFO" type="a5xx_2d_surf_info"/>
+	<!-- looks same as 0x2110: -->
+	<reg32 offset="0x2182" name="GRAS_2D_DST_INFO" type="a5xx_2d_surf_info"/>
+<!--
+0x2100 and 0x2180 look like same thing (RB and GRAS versions)..
+   0x86000000 for copy, 0x00000000 for fill?
+
+0x2184 0x9 for copy, 0x1 for blit (maybe bitmask of enabled src/dst???)
+ -->
+	<reg32 offset="0x2184" name="UNKNOWN_2184"/>
+</domain>
+
+<domain name="A5XX_TEX_SAMP" width="32">
+	<doc>Texture sampler dwords</doc>
+	<enum name="a5xx_tex_filter"> <!-- same as a4xx? -->
+		<value name="A5XX_TEX_NEAREST" value="0"/>
+		<value name="A5XX_TEX_LINEAR" value="1"/>
+		<value name="A5XX_TEX_ANISO" value="2"/>
+	</enum>
+	<enum name="a5xx_tex_clamp"> <!-- same as a4xx? -->
+		<value name="A5XX_TEX_REPEAT" value="0"/>
+		<value name="A5XX_TEX_CLAMP_TO_EDGE" value="1"/>
+		<value name="A5XX_TEX_MIRROR_REPEAT" value="2"/>
+		<value name="A5XX_TEX_CLAMP_TO_BORDER" value="3"/>
+		<value name="A5XX_TEX_MIRROR_CLAMP" value="4"/>
+	</enum>
+	<enum name="a5xx_tex_aniso"> <!-- same as a4xx? -->
+		<value name="A5XX_TEX_ANISO_1" value="0"/>
+		<value name="A5XX_TEX_ANISO_2" value="1"/>
+		<value name="A5XX_TEX_ANISO_4" value="2"/>
+		<value name="A5XX_TEX_ANISO_8" value="3"/>
+		<value name="A5XX_TEX_ANISO_16" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="MIPFILTER_LINEAR_NEAR" pos="0" type="boolean"/>
+		<bitfield name="XY_MAG" low="1" high="2" type="a5xx_tex_filter"/>
+		<bitfield name="XY_MIN" low="3" high="4" type="a5xx_tex_filter"/>
+		<bitfield name="WRAP_S" low="5" high="7" type="a5xx_tex_clamp"/>
+		<bitfield name="WRAP_T" low="8" high="10" type="a5xx_tex_clamp"/>
+		<bitfield name="WRAP_R" low="11" high="13" type="a5xx_tex_clamp"/>
+		<bitfield name="ANISO" low="14" high="16" type="a5xx_tex_aniso"/>
+		<bitfield name="LOD_BIAS" low="19" high="31" type="fixed" radix="8"/><!-- no idea how many bits for real -->
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="COMPARE_FUNC" low="1" high="3" type="adreno_compare_func"/>
+		<bitfield name="CUBEMAPSEAMLESSFILTOFF" pos="4" type="boolean"/>
+		<bitfield name="UNNORM_COORDS" pos="5" type="boolean"/>
+		<bitfield name="MIPFILTER_LINEAR_FAR" pos="6" type="boolean"/>
+		<bitfield name="MAX_LOD" low="8" high="19" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD" low="20" high="31" type="ufixed" radix="8"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<!--
+		offset into border-color buffer?  Blob always uses 0x80 for FS state
+		if both VS and FS have border-color.
+Seems like when both VS and FS have bcolor, one starts 0x300 after other..
+and 0x80 in TEX_SAMP.2 ..  blob doesn't seem to be able to cope w/ multiple
+different border-color states per texture..  Looks something like:
+0000: 3f000000 00000000 00000000 3f800000 00008000 ffff0000 00004000 7fff0000
+0020: 00003800 3c000000 80100010 0000f008 ff000080 7f000040 c0000200 00800000
+0040: 00003800 3c000000 00000000 00000000 00000000 00000000 00000000 00000000
+*
+0300: 3f800000 3f800000 3f800000 3f800000 ffffffff ffffffff 7fff7fff 7fff7fff
+0320: 3c003c00 3c003c00 ffffffff 0000ffff ffffffff 7f7f7f7f ffffffff 00ffffff
+0340: 3c003c00 3c003c00 00000000 00000000 00000000 00000000 00000000 00000000
+
+		 -->
+		<bitfield name="BCOLOR_OFFSET" low="7" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3"/>
+</domain>
+
+<domain name="A5XX_TEX_CONST" width="32">
+	<doc>Texture constant dwords</doc>
+	<enum name="a5xx_tex_swiz"> <!-- same as a4xx? -->
+		<value name="A5XX_TEX_X" value="0"/>
+		<value name="A5XX_TEX_Y" value="1"/>
+		<value name="A5XX_TEX_Z" value="2"/>
+		<value name="A5XX_TEX_W" value="3"/>
+		<value name="A5XX_TEX_ZERO" value="4"/>
+		<value name="A5XX_TEX_ONE" value="5"/>
+	</enum>
+	<enum name="a5xx_tex_type"> <!-- same as a4xx? -->
+		<value name="A5XX_TEX_1D" value="0"/>
+		<value name="A5XX_TEX_2D" value="1"/>
+		<value name="A5XX_TEX_CUBE" value="2"/>
+		<value name="A5XX_TEX_3D" value="3"/>
+		<value name="A5XX_TEX_BUFFER" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TILE_MODE" low="0" high="1" type="a5xx_tile_mode"/>
+		<bitfield name="SRGB" pos="2" type="boolean"/>
+		<bitfield name="SWIZ_X" low="4" high="6" type="a5xx_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="7" high="9" type="a5xx_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="10" high="12" type="a5xx_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="13" high="15" type="a5xx_tex_swiz"/>
+		<bitfield name="MIPLVLS" low="16" high="19" type="uint"/>
+		<bitfield name="SAMPLES" low="20" high="21" type="a3xx_msaa_samples"/>
+		<bitfield name="FMT" low="22" high="29" type="a5xx_tex_fmt"/>
+		<bitfield name="SWAP" low="30" high="31" type="a3xx_color_swap"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<!--
+		b4 and b31 set for buffer/ssbo case, in which case low 15 bits
+		of size encoded in WIDTH, and high 15 bits encoded in HEIGHT
+
+		b31 is probably the 'BUFFER' bit.. it is the one that changes
+		behavior of texture in dEQP-GLES31.functional.texture.texture_buffer.render.as_fragment_texture.buffer_size_131071
+		 -->
+		<bitfield name="BUFFER" pos="4" type="boolean"/>
+		<!-- minimum pitch (for mipmap levels): log2(pitchalign / 64) -->
+		<bitfield name="PITCHALIGN" low="0" high="3" type="uint"/>
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="7" high="28" type="uint"/>
+		<bitfield name="TYPE" low="29" high="31" type="a5xx_tex_type"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!--
+		ARRAY_PITCH is basically LAYERSZ for the first mipmap level, and
+		for 3d textures (laid out mipmap level first) MIN_LAYERSZ is the
+		layer size at the point that it stops being reduced moving to
+		higher (smaller) mipmap levels
+		 -->
+		<bitfield name="ARRAY_PITCH" low="0" high="13" shr="12" type="uint"/>
+		<bitfield name="MIN_LAYERSZ" low="23" high="26" shr="12"/>
+		<!--
+		by default levels with w < 16 are linear
+		TILE_ALL makes all levels have tiling
+		seems required when using UBWC, since all levels have UBWC (can possibly be disabled?)
+		 -->
+		<bitfield name="TILE_ALL" pos="27" type="boolean"/>
+		<bitfield name="FLAG" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="BASE_LO" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="BASE_HI" low="0" high="16"/>
+		<bitfield name="DEPTH" low="17" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="6" name="6"/>
+	<reg32 offset="7" name="7"/>
+	<reg32 offset="8" name="8"/>
+	<reg32 offset="9" name="9"/>
+	<reg32 offset="10" name="10"/>
+	<reg32 offset="11" name="11"/>
+</domain>
+
+<!--
+Note the "SSBO" state blocks are actually used for both images and SSBOs,
+naming is just because I r/e'd SSBOs first.  I should probably come up
+with a better name.
+-->
+<domain name="A5XX_SSBO_0" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE_LO" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<!-- no BASE_HI here?  Maybe this is only used for 32b mode? -->
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="0" high="21" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ARRAY_PITCH" low="12" high="25" shr="12" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!-- bytes per pixel: -->
+		<bitfield name="CPP" low="0" high="5" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="A5XX_SSBO_1" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="FMT" low="8" high="15" type="a5xx_tex_fmt"/>
+		<bitfield name="WIDTH" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="HEIGHT" low="0" high="15" type="uint"/>
+		<bitfield name="DEPTH" low="16" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="A5XX_SSBO_2" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="BASE_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="A5XX_UBO" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="BASE_HI" low="0" high="16"/>
+		<!-- size probably in high bits -->
+	</reg32>
+</domain>
+
+</database>

-- 
2.39.2


