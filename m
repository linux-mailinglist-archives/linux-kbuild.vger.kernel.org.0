Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EEB430B61
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 20:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhJQSVY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 14:21:24 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:61550 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232672AbhJQSVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 14:21:22 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Oct 2021 14:21:22 EDT
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AqPt+Z6A9PwlBdFrlHemf55DYdb4zR+YMi2TD?=
 =?us-ascii?q?gXoQdfU1SK2lfq+V7YUmPHXP4gr5NEtNpTn/Atj/fZqGz+8X3WB5B97LN2TbUQ?=
 =?us-ascii?q?CTQr2Kg7GM/xTQXwfk8OkY+aB+GpIOaqyUfDwK6redkXDIa6dasaP3jdHV9Jjj?=
 =?us-ascii?q?80s=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="534378688"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 20:12:00 +0200
Date:   Sun, 17 Oct 2021 20:12:00 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: build reproducibility
Message-ID: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

If I do the following:

git clean -dfx
cp saved_config .config
make olddefconfig && make && make modules_install && make install

Should I always end up with the same kernel, regardless of the kernel that
is currently running on the machine?

I see a large performance difference between Linux 5.10 and all versions
afterwards for a particular benchmark.  I am unable to bisect the problem
eg between 5.10 and 5.11, because as soon as I come to a kernel that gives
the bad performance, all of the kernels that I generate subsequently in
the bisecting process (using the above commands) also have the bad
performance.

It could of course be that I have completely misinterpreted the problem,
and it has nothing to do with the kernel.  But I have tested the program a
lot when only working on variants of Linux 5.9.  I only start to have
problems when I use versions >= 5.11.

thanks,
julia
