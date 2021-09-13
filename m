Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41271409D17
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 21:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347571AbhIMT3w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 15:29:52 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:41856 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242654AbhIMT3q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 15:29:46 -0400
Received: by mail-oi1-f178.google.com with SMTP id 6so15495649oiy.8;
        Mon, 13 Sep 2021 12:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ZKrm3JFwDCEWz9SSMPNs1GsPW3Uuj4ZIMM/IhHhwf8=;
        b=Wduw/0EMaMASqkqOo3SnTcK5rsEG5hRKHw8sYjd+mVxDFuuRkDG+kQutSC6dxBrvhW
         xZ5cCwLgR3f6B4/i06fJwp0tF0BqUD9YRhUyYJtteK2YFf60JpThwr5uNvSUk3KTMEzg
         0aaMpu5EFLluekqUVxN9Ehik7gFNUkMvyX31QWxuivkPjhAJKo6JSJjus39KSUOC51WZ
         f/UUPE1pdmFo/OWCngVvgOyRNI1/uKIOaFv8Z4+lfW6SDJAvruah000fTeJllH20Tbnf
         nGdWc7pT2BFAePFRHEaa10OSPMOLZFHG3sKILukMVukOkATuN8GZHoy77ITBt/VSspn9
         E0hw==
X-Gm-Message-State: AOAM5306OPJ+/4aTQINE2BnF9weE/ncd9apHl+TAfM/Gz+zDqrYGbcGM
        GJpm9I2V1HwE9Z6gBf0pMQ==
X-Google-Smtp-Source: ABdhPJzGujT8h0f+vj7IE5u1yfIMMd1RcTFZznLmqp9NuLIaVlBthUgGpvpj6x0bLUtKIu66LMo8eg==
X-Received: by 2002:a05:6808:b21:: with SMTP id t1mr9025535oij.165.1631561310059;
        Mon, 13 Sep 2021 12:28:30 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:29 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 8/8] kbuild: Enable dtc 'unit_address_format' warning by default
Date:   Mon, 13 Sep 2021 14:28:16 -0500
Message-Id: <20210913192816.1225025-9-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With all the 'unit_address_format' warnings fixed, enable the warning by
default.

Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 54582673fc1a..56d50eb0cd80 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -310,7 +310,6 @@ DTC_FLAGS += -Wno-interrupt_provider
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
-	-Wno-unit_address_format \
 	-Wno-avoid_unnecessary_addr_size \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
-- 
2.30.2

