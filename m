Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB934AA6F0
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Feb 2022 06:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbiBEFp2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Feb 2022 00:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239000AbiBEFp1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Feb 2022 00:45:27 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB587C061346
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Feb 2022 21:45:26 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i186so6958650pfe.0
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Feb 2022 21:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theiggy-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRcwnyx1VamOTEQ4zibujTljvRepcyTJBwRAFYmirWc=;
        b=LJPqTRNu6+TUarTLHc5vfhYGYTqAXCZpl8xWBtTfAcGAzkDExk5Ywqj5QAYmDReUW+
         LWHGUr203R78kxEptrDQyPebTS+POvCtdYi2+cHRazsJHg/SLKLDyPwpAvh4C4aBSOpK
         RbMCwd3MeHoHS+RL/N7atS+jjAHTU3xLP63g3JN3byEotJv1idRKMFGNFdNrEjvcpvW2
         KIjyEqVRUgfn9sVfN20YHnaZTtZzTtgoXLx4eM0IKcTxCflDBwmiccjnLvQcb6vKvRuC
         yNm0bqZus438Wx4Sx0m+BaEMlug9nH80gGIH8yQNqZkspj+SKK63f7chMDVU/YS2BEZq
         3X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRcwnyx1VamOTEQ4zibujTljvRepcyTJBwRAFYmirWc=;
        b=X++4QbvGM7NEjpfssqQCVj8D+yH1BROBd7STZIVTs+9LWjtAeFOWtJ06QW6sksKrsN
         5sFhBlwe2NXyMlxg7YyuxtXOzT9/34Uh/TuCxvxmIrMPtGvB3MT0AgpZePksXQhTd55V
         pWJ6ZOqJ+VKLhaotI70gm0e3oezm0MBgDQEzo8Ws4BvhkQVyf27pp8FQrlE2pYNzmtHQ
         lj80Bl/mtgj/jamEfIPfYXpLfq7Ocz1cr+a3C8lMD3iHsyDGAVYn8+8I4cF4zyW5W5VI
         PEpWueGV8jPmUvpewIgYIAc/MRWmVx6j3WfZnvb+NbS7Hl1ZElM6yVrG8qMLntg6EtNU
         55iA==
X-Gm-Message-State: AOAM532g4xZMNlN4iFT3zmHdIcLwkAUbB7klskzEqQOfGn5XVJYW8jo5
        gmWBBwD0FWByipZfFqXcDChbmnwoO4GXGQ==
X-Google-Smtp-Source: ABdhPJxztrgAE3yRnY2nqfowpGPl7awZCdkF8VAsepbxuLiwQGPAJARDrRiBtqclp311Y4BUMn+Y3A==
X-Received: by 2002:a63:b207:: with SMTP id x7mr1903636pge.392.1644039926032;
        Fri, 04 Feb 2022 21:45:26 -0800 (PST)
Received: from venkman.lab001.kws1.com (23-114-170-204.lightspeed.irvnca.sbcglobal.net. [23.114.170.204])
        by smtp.gmail.com with ESMTPSA id u16sm2926771pgh.54.2022.02.04.21.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 21:45:25 -0800 (PST)
From:   Iggy Jackson <iggy@theiggy.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Iggy Jackson <iggy@theiggy.com>
Subject: [PATCH 0/1] fix PVH bootable kernel on some compilers
Date:   Fri,  4 Feb 2022 21:45:17 -0800
Message-Id: <20220205054518.3863277-1-iggy@theiggy.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Certain compilers (I haven't quite tracked it down to if it's a certain
version or distro specific things) strip out some metadata that is
required for PVH bootable kernels to boot properly. They require a couple
extra CFLAGS to tell them to not.

Iggy Jackson (1):
  fix PVH bootable kernel on some compilers

 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.34.1

