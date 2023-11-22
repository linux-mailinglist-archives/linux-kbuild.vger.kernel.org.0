Return-Path: <linux-kbuild+bounces-124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72E7F531A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 23:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96085B20FCC
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 22:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C971F947;
	Wed, 22 Nov 2023 22:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AC61BD;
	Wed, 22 Nov 2023 14:12:45 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-359c1f42680so876265ab.2;
        Wed, 22 Nov 2023 14:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691165; x=1701295965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shYyO58BPes3ozOUzmFhahNxoCiZTriaHChWVdh269w=;
        b=omMUj/9PmI/bVj2XUQJZ0AiwhwX9qoa4nFEKbAlgSRZPyU42S9f74UBXRARR0Zwgy7
         NhhtmoTYfDCV4LFD0ZUSVs3jJZOl2dhE/j5O2/AenNl+BILKH3ztmQhJyVY585bqa3p0
         BXnnjjOGdo8yavzG4tuE/ErJntQJU4t72nx2zpbW9nlWKGEEIF3n/exxSY6u7qoRL+z8
         DdRBIM/uEZ5sQyc19qWeKZ9WwJ3zotIioH3xgQrmwRfua7R18PF7D+M+rXAPQ20+l683
         wZMx6aIt8eqCeSMQeqHsAblCfUbHEQVtreyuJYsEnk200iq2h8hbsSdJSJKXOoUoNkTf
         CgGQ==
X-Gm-Message-State: AOJu0YxRiXpIsAFED8Bxeb0izCY+RvV/Vf7+VqEUygUbR4UuLWODM+yp
	lxW/gfGhfK5pzvh7FNsXqZwV0nMDpw==
X-Google-Smtp-Source: AGHT+IFMJzsEvpbSktexSSdFIfR9OaWDnu0zBfHOB7Y/r6iYkYi/TaZpUgTAHm5TMgYN9AvcD7iJ5A==
X-Received: by 2002:a05:6e02:603:b0:357:704a:8699 with SMTP id t3-20020a056e02060300b00357704a8699mr3547266ils.8.1700691165100;
        Wed, 22 Nov 2023 14:12:45 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id em4-20020a0566384da400b0045b4a059a57sm91639jab.44.2023.11.22.14.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:44 -0800 (PST)
Received: (nullmailer pid 2753840 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:34 -0700
Subject: [PATCH v2 3/4] riscv: dts: Always enable extra W=1 warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-dtc-warnings-v2-3-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev

As all RISC-V .dts files are W=1 clean, enable the W=1 warnings all the
time.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/riscv/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 72030fd727af..a7b17e0ac8c8 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+export KBUILD_EXTRA_WARN_DTC=1
+
 subdir-y += allwinner
 subdir-y += canaan
 subdir-y += microchip

-- 
2.42.0


