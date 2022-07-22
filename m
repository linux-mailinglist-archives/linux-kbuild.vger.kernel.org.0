Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40D057D89C
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jul 2022 04:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiGVCZJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jul 2022 22:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbiGVCYu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jul 2022 22:24:50 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138CD98201
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:41 -0700 (PDT)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 80F613F129
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jul 2022 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658456679;
        bh=rPPCOknk12Lnh3nWhsdYWqa1mH1t/OQEcqVOb72oZWk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ZV4IuniIEjzX9z9SvCaco7mf/9gnod6Uvnu1QAphZ6uq1Vwt/5Jg5/iMLpVPq6I6E
         4KOKr5P3yHmThHdjGLi676xlmlqSBwkBuowoknrwvZ0cm6LsNn5ihJqKWlFw94VYjT
         gH/YBdUt37Sv7SyFomg/rFRblgfre6IjZ1eslQGfxrQg4A1YBosFJbZgbbSNjiUar0
         2NE7KD14ckvpAar6dTMYmtXWlLxg1oTUlQnAgSbd8uEL76hw6X+q1Asx8BZmHdKIO2
         lDZiH4iH/Mr0HOzKnEENYCY46CCugy04FmKrYR9Ub8vrlwa/93jZK6zuvpUopKy9PJ
         y52LJznxqwNlw==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1048dffc888so1799225fac.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 19:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPPCOknk12Lnh3nWhsdYWqa1mH1t/OQEcqVOb72oZWk=;
        b=bV95fvDW1T+2ZoNNOEPea/a/FbBkgR+3mBNo/dUOpL48RSLr/6J25YMuDTi3oh+R6+
         dh4Cp+Vm5zMn/dd/g1KL/VkCgLLmo3mW+L1qo84s9WRI5AGiotpd2v/HUQGjSoFZFcdp
         sgawEHW6k53LXplxAalRv1Ioro5+5T53wOrqczsuo836uxRIRwm0NLCfvy6KANrDiOgz
         1asQg2YpnpuGNpcQ6DOZ5WVZ6luQU7NpOQHTDjqyljwCZKAiCJLMNzdu9/6+9EQr5gk4
         OIFpJ0+E0C690K6WQHEcRYYtB2swOau81flMivesWMXaw/xdRucN0SXfOoSNnmx0g8J2
         ztGQ==
X-Gm-Message-State: AJIora8bpuREy9oeffva1QpYoepLKeJQyZzxOCYrlL10XJlmAI9rHTL2
        FE76zBBgJDcfGaQ77IFEZYjgE5QgRfCknV3CQjfBwp3DiTu6Yf30jYPFCLikHhhanuhRYwFVp4q
        mIVLCwgQJN08jF760ceN82iRKhvmdk6UjaTl0c7EWRg==
X-Received: by 2002:a05:6808:d52:b0:339:c88b:8100 with SMTP id w18-20020a0568080d5200b00339c88b8100mr5817225oik.93.1658456679125;
        Thu, 21 Jul 2022 19:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shUKvZ85RWsVY2FWznWPtQPVSjurfGAiTl4rOQmkm6bAI1hnYtfZhQRHhT4FIYWpHeOcMWbw==
X-Received: by 2002:a05:6808:d52:b0:339:c88b:8100 with SMTP id w18-20020a0568080d5200b00339c88b8100mr5817215oik.93.1658456678903;
        Thu, 21 Jul 2022 19:24:38 -0700 (PDT)
Received: from mfo-t470.. ([2804:14c:4e1:8732:c479:1206:16fb:ce1f])
        by smtp.gmail.com with ESMTPSA id k23-20020a056870959700b000f5f4ad194bsm1814528oao.25.2022.07.21.19.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 19:24:38 -0700 (PDT)
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Subject: [RFC PATCH 5/6] netfilter: conntrack: use MODULE_SYSCTL_TABLE
Date:   Thu, 21 Jul 2022 23:24:15 -0300
Message-Id: <20220722022416.137548-6-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722022416.137548-1-mfo@canonical.com>
References: <20220722022416.137548-1-mfo@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Let's take nf_conntrack as an (actually helpful) example and exerciser,
as it has many sysctl entries, and other module aliases already.

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 net/netfilter/nf_conntrack_standalone.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 05895878610c..2da628f054cf 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -980,6 +980,8 @@ static struct ctl_table nf_ct_sysctl_table[] = {
 	{}
 };
 
+MODULE_SYSCTL_TABLE(nf_ct_sysctl_table);
+
 static struct ctl_table nf_ct_netfilter_table[] = {
 	{
 		.procname	= "nf_conntrack_max",
@@ -991,6 +993,8 @@ static struct ctl_table nf_ct_netfilter_table[] = {
 	{ }
 };
 
+/* MODULE_SYSCTL_TABLE(nf_ct_sysctl_table) already includes nf_conntrack_max. */
+
 static void nf_conntrack_standalone_init_tcp_sysctl(struct net *net,
 						    struct ctl_table *table)
 {
-- 
2.25.1

