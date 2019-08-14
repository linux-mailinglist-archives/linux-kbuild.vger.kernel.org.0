Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A536B8D18C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 12:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfHNKyf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 06:54:35 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:52503 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfHNKye (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:54:34 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7EAs34X024567;
        Wed, 14 Aug 2019 19:54:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7EAs34X024567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565780044;
        bh=3B0Eoe2uXzHeIIQDt22xl5xr4KiSl7c8jtKL7xard9w=;
        h=From:To:Cc:Subject:Date:From;
        b=nVKPV5Y2BbOn07Zuvy81OBAhjDxxKf1IroNtjOsLP6o/ArnU6UO+sLK9ql6svz1tB
         8vmUSpLNu5guPd/Nl2w5anO5knfT79bny49JmL4GMejB9N7DkBpAf0xXUJWqItA141
         /4LNzWFwqfw5VZXqlLLGO4IY/CdGrqGfHCMda/7L7bE+l0plasGZjT6dR36hFZjSNQ
         ll9fVAc9eQtp1LNWtBXLukCLyhBXa2kgIOxANozicyzrIZGA9r7ZNPSA78NG7knZis
         b6bMVa/UrjJx8KajJvAEOs/Yw0KCHJZgjsPv0Ate+t4+dNEbj3ZGJqVmb49dgG4KLO
         bU78TS67j9dNQ==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: two fixes for Kbuild document after the ReST conversion
Date:   Wed, 14 Aug 2019 19:53:58 +0900
Message-Id: <20190814105400.1339-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The ReST conversion was merged in the previous merge window.
Iron out some issues.



Masahiro Yamada (2):
  docs: kbuild: fix invalid ReST syntax
  docs: kbuild: remove cc-ldoption from document again

 Documentation/kbuild/makefiles.rst | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

-- 
2.17.1

