Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DD333818D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 00:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhCKXhC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 18:37:02 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:37766 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhCKXgp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 18:36:45 -0500
Received: by mail-io1-f51.google.com with SMTP id y20so5513576iot.4;
        Thu, 11 Mar 2021 15:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9UUu/RoWLjcoMUCzOwyLB7/lVKmOFSc2GGa4xYw7u8=;
        b=BgQHQJMpCF4h81Aj9HxieYRuKdJZwpmBCrrRSCStXNBxt6LY/NKe/9k1Tf1gU3KNbT
         oMcdfqhtHZosbVxSBAjMZbpMSV9GSIaMBmz0+8+hMeKe+NHi+gXIdui5i/rZBiBocOOg
         Yk1P6blScD8BYxQpx+DK0qjW21K+haYBv3CX6lLV/Ze2BpIgHwhRYb5gVcc5qVSHnr8q
         p/ReUdmEBGgv3pdsYytrY6+mNo+3rllRygnZzCcAwz8ZyYWOOj6kW9K8nvCmKqmixQ1S
         LyxuGbhvrElqEi7Qf9uyqZ3j+zpiLWtMipSpHS6AmgmezypPe5BM5yMvJFpFwAqfidt1
         e8ZQ==
X-Gm-Message-State: AOAM532PApiqx96IyksjIKJ/yDyMykF15o1YsxHPLpxKMdyywynx5Zto
        7IwGHge3+Nd909KIMn1t3xDmskagpA==
X-Google-Smtp-Source: ABdhPJxTrWbBJhWHQwhAd6M7LFZ1s5Uq0hc6N4vQVXYydFJxPAXh/+YNm9UB0ybt/QFvSU/TECCd6w==
X-Received: by 2002:a05:6602:2048:: with SMTP id z8mr8232583iod.143.1615505804311;
        Thu, 11 Mar 2021 15:36:44 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id y9sm1901016ill.15.2021.03.11.15.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:36:43 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/2] dt-bindings: Bump dtschema version required to v2021.2.1
Date:   Thu, 11 Mar 2021 16:36:39 -0700
Message-Id: <20210311233640.1581526-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There's several dependencies in dtschema since v2020.8.1 we need, so
let's bump the version required to v2021.2.1. Specifically, the
graph.yaml schema and improved undocumented compatible check are needed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 780e5618ec0a..81f0b3294c64 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -5,7 +5,7 @@ DT_MK_SCHEMA ?= dt-mk-schema
 
 DT_SCHEMA_LINT = $(shell which yamllint)
 
-DT_SCHEMA_MIN_VERSION = 2020.8.1
+DT_SCHEMA_MIN_VERSION = 2021.2.1
 
 PHONY += check_dtschema_version
 check_dtschema_version:
-- 
2.27.0

