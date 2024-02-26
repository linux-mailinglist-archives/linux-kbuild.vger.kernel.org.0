Return-Path: <linux-kbuild+bounces-1056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D38667DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C6E1F20F9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A70D534;
	Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFUYWtQx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CDEAE5
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913511; cv=none; b=fA7ZWUtUfDEnB0HBC1wq8A/0tsX7oys0mNTVddbfsb6x6w4YXd82J1CpHSEuP/cUJZJtSBWvpFFDL4WewzK1wcwwrAusSgZMDKNf/udy3B6pFgjTipfjaO2dM5vcEKFeMRAiJwTp4FU+zU+2BDpGQjQ/izcsaA5UHxpIBS9lLxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913511; c=relaxed/simple;
	bh=GCmbOiHpksQl5QzvCUG6WPQ7hoPhwGILSxcYlA8FkiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOEwxHwmL8d0FxxTlAgbSoiFYip+i3h2JrPqC1BxAt7/4odhjrJaI/jQwSBEXkSOIuEbJHek4k1Vo9uajNy/zGNsqes2W/afpYC+MD1zgeGqde6oek6zrDyS/tIFahUASmesrtPwa1mjDNmgiYznO9dyCiQLxCpP3EJ0sJf+TTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aFUYWtQx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512ab55fde6so3114412e87.2
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913508; x=1709518308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
        b=aFUYWtQxGJ7HmbFEUQU6L0admNGwZzwXSMMYX74ZjqKwYOubxaPtjD7EFcK8HLc3lh
         TmDBxkbp7c8m5IeaklSJKpXGQpnT4VsY9uWADbRZa9d5T7MT/Bp2xeLdpW2lmyguC0E0
         4b/WVNqzAQktIY5t98U82Np5zr6E0nPa5FXQ9ZHCPLWRePYH15nXbET90M4xt/FWZsEW
         mH9+n9kzDHgak7bX7w/NNjsRPYqVznDmFprXqQOrWprGyG4LoZEZ8vP0fY8aANjhGhVQ
         ygFrfgGCAawptkjpP4wxfuJHLyctQge5uYcWbpDwep+FnCEO5hGlcPvMCwOJams3pRpi
         k0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913508; x=1709518308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
        b=OVIvUQGwT18W9efQopqMCW1wRrz5vRbfpNE2gGXWbJCoNbKvOYSQ7YeLktcJCPsFOB
         uGCUwO9KxxMnvZVLoUtZ9BkkSoRGwfqr3ldsKu3ppWenizq7O9Nkmqgl3FYm6RaDGRhm
         ZsuLJKYVf4A9kUBDRqwZMszhKAMr1yvuFGlbvSONf/J05p66NozvjHyjZ40/wrRNtXc9
         oVQnGXm4aRdTI8HuX82MZKQYisbuEAbiB21RqOyFiOG4a3hTxcYCNono2S/KjD6rxuCM
         auWVgsFotjAmv3GgdN45s0t2eO5d5sd6meGbU9IfkO5P0l7CwuvwFJ6csW4H5an4bkqb
         K9Zw==
X-Gm-Message-State: AOJu0YwI2j7LPF0d9gtKdHEull+6HKVfk/XaJUY5CIqjYdOoKgtj8yq4
	efK5R7DdMI/rwHutcLSbNk4fpMewWnx1MvuNTPY2l9xtByBXylO/k6Bw30Apjj0=
X-Google-Smtp-Source: AGHT+IGM6arZuGaiRIqhoTaiESYpSqS7ARUqNQhjVEnkptr/m2/6XCawaKQgJuuQGgnyQSeG+9VzLQ==
X-Received: by 2002:a05:6512:ea5:b0:512:fc6a:2d10 with SMTP id bi37-20020a0565120ea500b00512fc6a2d10mr1487797lfb.40.1708913508068;
        Sun, 25 Feb 2024 18:11:48 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:37 +0200
Subject: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GCmbOiHpksQl5QzvCUG6WPQ7hoPhwGILSxcYlA8FkiE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NggplOAhkZ4TcIUVFZRYGYJgjLoTm1ot7+w
 zpS8LPTlAaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1bBlB/9thCMztpjZ24AQZfOl4nGcw36lRs6sD8zWSRDqcZ7DDXW88HukH6n9X4QEYqtIrmCv3Uf
 I2u2GjCLznZKSn0lsK6JVodcOS1pxZOr9aEG0RsVOgVGNdT0UiMqBHFMdLZOMEc40hTlNMc5KEp
 LbOvELeAMQ22xduaK228sjQs3A24dUtq19IdBx0pJYjkBqG3SYhQi0+M2PbsKpmZy5ByqiroHl7
 ymxm4UCKSgEmmzxWxknN6HoVtSeZlSsejTjfDKjcQeL0GWnhE52u1JA4aOPketCWodUKkwg3Kg3
 KVqi53EWoXeS+iQoxFilQyly44dJ9U1sl/RGFZ1K1CcWnviO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The driver might decide to put the _shipped files to the subdir. In such
case the cmd_copy might fail because the destination directory is not
present. Call mkdir -p to make sure that the destination directory is
present.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..94373eeac420 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -297,7 +297,7 @@ endef
 # the copy would be read-only as well, leading to an error when executing the
 # rule next time. Use 'cat' instead in order to generate a writable file.
 quiet_cmd_copy = COPY    $@
-      cmd_copy = cat $< > $@
+      cmd_copy = mkdir -p $(shell dirname $@) && cat $< > $@
 
 $(obj)/%: $(src)/%_shipped
 	$(call cmd,copy)

-- 
2.39.2


