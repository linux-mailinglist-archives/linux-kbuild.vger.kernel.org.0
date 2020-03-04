Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4538B178911
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 04:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387658AbgCDDVF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 22:21:05 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:63546 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgCDDVF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 22:21:05 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0243Kef3018747;
        Wed, 4 Mar 2020 12:20:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0243Kef3018747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583292042;
        bh=QzOTO3SsMKY2Q7DQRWMpf5aQpJE3CwBx59JpgxcTX4U=;
        h=From:To:Cc:Subject:Date:From;
        b=Ygx/N2hhBeHixhHaqfP20GATLfA3Eu+vtWQpIWRWkpwlUJY8Y7S9GbzQIcnbR5YUg
         ef3dormx12kdAiDEQ1/1aLBlL7tBXtNeu8Q9mwPNTmZMmaE68M6gC4B53Q8ZgX38hj
         70zI+ayoixK+Sfd7rjpdhoV3xe8q7HdItbcKZvIKH/chRntmK0OoxYWCBKr+Y4IJj+
         nirXT20MDU2dvIl3I+DjBbuhmkzICd5hjHNa+39V1COsKbqdJVIDMj8rt163iT8Mna
         4oHHmuuMi6G2yeoNqGtOkgU5Sg+982q22FUpLB87njz0oDFwWRmhzxc3dELXQvQjGm
         kVi1BoL3UF7Ow==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 0/3] kbuild: improve DT build rules
Date:   Wed,  4 Mar 2020 12:20:35 +0900
Message-Id: <20200304032038.14424-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


This series is applicable on
Linus' tree + the following two patches:
https://patchwork.kernel.org/patch/11413625/
https://patchwork.kernel.org/patch/11413623/



Masahiro Yamada (3):
  kbuild: avoid concurrency issue in parallel building dtbs and
    dtbs_check
  kbuild: allow to run dt_binding_check and dtbs_check in a single
    command
  kbuild: allow to run dt_binding_check without kernel configuration

 Documentation/devicetree/bindings/Makefile  |  8 +++-----
 Documentation/devicetree/writing-schema.rst |  4 ++++
 Makefile                                    | 16 ++++++++++++----
 scripts/dtc/Makefile                        |  5 +++--
 4 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.17.1

