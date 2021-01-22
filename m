Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2120C300CD9
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 20:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbhAVTmm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 14:42:42 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:52514 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730634AbhAVT25 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 14:28:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611343707; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NLASw+FMPYsOPSzQUMWurko1Y5QqPihZKYt4qAXLYvw=; b=EFDGA9CAZO4S8h3epDhlLzoy1DE45+Y26ue5bzsvnkzp+qP3B/7++o+9G7qtN8VVKxGmsOXR
 EollkCIokWVxmmiZLEZTAA9kzB/eQamfUqeH5pAlVi+GC89h8FZYhMR1GhjiFetJi2hv2P+W
 lZC9Kg217iGBT262TOI591o8llc=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 600b273b2c36b2106db2cdff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 19:27:55
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8E64C43464; Fri, 22 Jan 2021 19:27:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FFEBC433ED;
        Fri, 22 Jan 2021 19:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8FFEBC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>
Subject: [RFC 0/2] Kbuild: Support nested composite objects
Date:   Fri, 22 Jan 2021 11:27:16 -0800
Message-Id: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series was developed after discussion in https://lkml.org/lkml/2021/1/19/850

The motivation for this series is an out-of-tree module which contains a large
number of source files. This causes Kbuild to exceed the maximum command line
argument length when linking the files. Proposal here permits composite objects
to contain other composite objects. This allows the driver to split linking into
several steps and avoid the maximum command line length error.

Kbuild composite objects only supports one level of composite objects.
That is, a composite object may only be composed of real compilable
source files.

As a simple example, the following Kbuild description is now supported:

bar-a-y := a/bar0.o a/bar1.o
bar-b-y := b/bar2.o b/bar3.o

foo-objs := bar-a.o bar-b.o

obj-m += foo.o

Add such support by recursively searching for composite objects and
listing them in $(multi-used-*) and $(real-obj-*).

Elliot Berman (2):
  Kbuild: Make composite object searching more generic
  Kbuild: Support nested composite objects

 scripts/Makefile.lib | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

