Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593EA326FE3
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 02:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhB1BUS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 20:20:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:58594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhB1BUS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 20:20:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A18D64DE5;
        Sun, 28 Feb 2021 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614475177;
        bh=JOTKuWdXFQIG7mOjCw+Z8b3WqNrQCwF3E8ra9+Zy89s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZLW6CSEXh0sorRL7sn73xL7ZhPkCFjN6ft3igqwzFdMoU4/dHsPYX7m1Vr3bjPR3C
         qdiKKxMZdPXQI63vKfgYkdw8JGaam9OrvTyjJ1sWf7CRPtCg0rsatdzwmEYsRPdSpX
         Ie4lH9/NhN+Mg//vXBXR1EyP0jgZa2ymGZ5kN8Mw2+8J5k+TVAxiDisAFIX2iD/vDS
         tgJbFcVRH3JypAW3nC9on0DQxWPS4L77HYPJga29asjUBf4W3r75rnS45kUn4inXiV
         VBDmsLIt+HkLpdt67AEaKkX7EoTx0SOQf5ONA/toaoxhY/BKyZH9plDFDuQowRuuMa
         t1WCGx8Vw61fw==
Date:   Sat, 27 Feb 2021 20:19:36 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Fix <linux/version.h> for empty SUBLEVEL or
 PATCHLEVEL again
Message-ID: <20210228011936.GD473487@sasha-vm>
References: <20210227142023.63480-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210227142023.63480-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 27, 2021 at 11:20:23PM +0900, Masahiro Yamada wrote:
>Commit 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255") breaks the build
>if SUBLEVEL or PATCHLEVEL is empty.
>
>Commit 78d3bb4483ba ("kbuild: Fix <linux/version.h> for empty SUBLEVEL
>or PATCHLEVEL") fixed the issue by prepending a zero.
>
>This time, we cannot take the same approach because we have C code:
>
>  #define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL)
>  #define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
>
>Replace empty SUBLEVEL or PATCHLEVEL with a zero.
>
>Fixes: 9b82f13e7ef3 ("kbuild: clamp SUBLEVEL to 255")
>Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-and-tested-by: Sasha Levin <sashal@kernel.org>

Thank you!

-- 
Thanks,
Sasha
