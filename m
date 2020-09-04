Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E459A25E276
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 22:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgIDUOI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Sep 2020 16:14:08 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34806 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgIDUOD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Sep 2020 16:14:03 -0400
Received: by mail-lj1-f196.google.com with SMTP id v23so9451481ljd.1;
        Fri, 04 Sep 2020 13:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=At+S5JZyc9Zm+52GjsVD6sS7Q92PnPRfNew2jlCBSY4=;
        b=CYh51hfOSGSU1k025B/yyx52c1q1eDqhCjILVvznk8+axwX7sVyOQ1GADMKccuzylr
         w8CNdNqzIm56sUrPy38XJxviuaWyZqLGNpng/v5cyStt28vEYI4EJoID2cYDEEl3eSQx
         cUsxgxLpl/GyQbSulAVwJdT0oafSFZYvEiKAJGGtlgB/Wbshp7EdlvCgikzAJ5BdH1Yu
         xR0VzctUqpd22pWq7T4BpIGE0lfldaVXz/IUX+g3S0crPnRdPLz/zHFCADxa7ePadBeT
         HiZ2j4zKwyJ2Z176gpvJzWSNUIQPDgj8/LlzrhsQEdtb5rxZCSZKpVJtmXzl+Jgq1bQ+
         ONRA==
X-Gm-Message-State: AOAM531RZd0lLgdIqEBDqb3kSJgACK6HovFia8FfrGdTUeqOCJzn2Weg
        2c8HiQWafjd87l4m+CtcmTA=
X-Google-Smtp-Source: ABdhPJyOWTIqrtXqErOx88+91MdhEusWqnJHGxKq/QirYJUhbK/MdJOSOdDLCajmGAobK2J007RA8w==
X-Received: by 2002:a2e:9047:: with SMTP id n7mr4954800ljg.125.1599250440040;
        Fri, 04 Sep 2020 13:14:00 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.googlemail.com with ESMTPSA id a16sm1468533ljj.108.2020.09.04.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 13:13:59 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] drop GZFLAGS definition
Date:   Fri,  4 Sep 2020 23:12:56 +0300
Message-Id: <20200904201258.795438-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GZFLAGS is not used. KGZIP env var can be used to pass
additional flags to gzip instead.

Denis Efremov (2):
  ARM: makefile: Drop GZFLAGS definition and export
  csky: Drop GZFLAGS definition

 arch/arm/Makefile  | 3 +--
 arch/csky/Makefile | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.26.2

