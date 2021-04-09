Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9656359CBA
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 13:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbhDILKz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 07:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhDILKy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 07:10:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8323DC061760;
        Fri,  9 Apr 2021 04:10:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id n8so9124697lfh.1;
        Fri, 09 Apr 2021 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTGSojB1p0GIuzN4LK3eQfQd4PSDYHeJzhPj7VxYv5s=;
        b=swRIo78Tx6wjeC3T33k43CmBXkooWNcUYgqA/XptyQioRSepwQ1b+b27YjOcuuZZIm
         mPEoBA1sGgwv9r/M3p6PbiKsz0nsByfoTHtl1DMLo/UQcilDVo5bg/SmegFTbknovXHP
         kBb5yAqkvJc/r6dfLWFyoH8wJxIB2cEei/1okbDEIT/ngC1LX7f4DQ3DQ5p9QY/K9erY
         yCh5UR/jMo/uudMkKEHMy61SZ5W9v29E2NGXD/mbEKY4R3FyNlRPHMgXpUw71LM86kEf
         AGaARsYw+F4rqRPDxIfi7XzlPsRkY5gtO16T112l4d2ixI7KRUC8V6MX9z2YLuY5QSYX
         +ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTGSojB1p0GIuzN4LK3eQfQd4PSDYHeJzhPj7VxYv5s=;
        b=Gkd+1lo47kzYn95zk3Sk3YOCKFaxtYFl3oBEzwihh93XuvecKKo3jjbPkw+Nn4QpUr
         Kq2Gjxf0G7GL5drWmLmUBTZaDkTe/dZqYgin43XoijXyMbDUv5rzrVENAhJj0j1xT6BI
         EEziZ31trYSUC4iVGTy0UgSORjFce9VFtO5HHriWjDgECYhlHgV612hcVHChDQnkm+3a
         mQnxk3bdd82hPO6+dskWw9i+PC9QDpr9hLilXSSp8H6dJPjLpSezF1FeuP6/yzXgqPG6
         wr/r1/dEUv4YhVE7VZz20YgIvlCgzyA6ZSjZvvGlaqxKiMbhFldciiIuAgIhJ3wD3Jj7
         X8hg==
X-Gm-Message-State: AOAM530T20YO0iDLVN+niXL7sSeFVuEyxVhbXhQ7CNVEzyb31hizmaU9
        Xe+YlUByIuxG6J4I8LwAw+M=
X-Google-Smtp-Source: ABdhPJy2Z/HDSD43zwS6lCNuBcuvejo2ytLgGWkAbTOUsjnZ8k355Ca7RRKLO2O9NR2zclLP9/krMA==
X-Received: by 2002:ac2:5591:: with SMTP id v17mr10087187lfg.82.1617966640081;
        Fri, 09 Apr 2021 04:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id h10sm236572lfc.266.2021.04.09.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:10:39 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     lucjan.lucjanov@gmail.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, oleksandr@natalenko.name,
        sedat.dilek@gmail.com
Subject: Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
Date:   Fri,  9 Apr 2021 13:10:33 +0200
Message-Id: <20210409111033.2465074-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
In-Reply-To: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I originally posted the patch in a different form [1] even before Masahiro's changes. 
I've been testing this solution since December last year and posted it in March this year, 
after I made sure everything was working fine. This patch was tested by Oleksandr and he also didn't report any objections. [2]

Masahiro notified me about the planned changes [3] and asked me to resend this patch, adjusted to those changes, which I did.

My current logs:

lucjan@archlinux ~ $ zgrep CONFIG_DEBUG_INFO /proc/config.gz
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_DWARF4=y
CONFIG_DEBUG_INFO_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
lucjan@archlinux ~ $ zgrep CONFIG_MODULE_COMPRESS_ZSTD /proc/config.gz
CONFIG_MODULE_COMPRESS_ZSTD=y
CONFIG_MODULE_COMPRESS_ZSTD_LEVEL=19

Pay no attention to CONFIG_MODULE_COMPRESS_ZSTD_LEVEL as this is not in the upstream, it's an additional patch I use. 

The only difference - I don't use clang. Maybe those who use will comment on this. 
I relied on the opinions of Oleksander and a dozen other users who reported no errors in using zstd module compression.  

[1] https://marc.info/?l=linux-kbuild&m=161710402402989&w=2

[2] https://marc.info/?l=linux-kbuild&m=161710503403517&w=2

[3] https://marc.info/?l=linux-kbuild&m=161780602730829&w=2
