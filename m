Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54160217FFA
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 08:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgGHGwx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 02:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgGHGww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 02:52:52 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1D1C061755
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 23:52:52 -0700 (PDT)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 0686qjTp010571
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 8 Jul 2020 08:52:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1594191165; bh=xn7XZjDK8Zj1OGtdFhRlAjKLCoyNWabIcQT7LCDZnSs=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=nWlhQNtsdcg1A5iNb9pHaw4MTBXYiNlBiXDfUpn+jz33iOmTIoenYKQEHmw+jiumg
         Yb6OnqIVMEHlKfB/vI+TBcPv3HGEqJydGYsT//jW2Qt/BUXsJtowBivRO6XOyNpUFG
         fzLOgUztcJ+cqpjIzr/j/yjXN2vBVLo5aoB/t+2g=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1jt3wj-000WsT-2Y; Wed, 08 Jul 2020 08:52:45 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Kbuild support for rebuilding a single driver gone?
Organization: m
References: <87lfjvbfkw.fsf@miraculix.mork.no>
        <CAK7LNAS=1M0NXeQUMnD63O=fAKTptnSRwjE_o6_jVKUv3_7q5Q@mail.gmail.com>
Date:   Wed, 08 Jul 2020 08:52:45 +0200
In-Reply-To: <CAK7LNAS=1M0NXeQUMnD63O=fAKTptnSRwjE_o6_jVKUv3_7q5Q@mail.gmail.com>
        (Masahiro Yamada's message of "Wed, 8 Jul 2020 01:42:35 +0900")
Message-ID: <87y2nua476.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.2 at canardo
X-Virus-Status: Clean
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> Please check this:
> https://patchwork.kernel.org/patch/11649263/
>
>
> It will be included in the next pull request,
> and eventually back-ported to stable kernels.

Thanks.  That was really fast!

I can confirm that this patch fixes the issue.

> Meanwhile, if M=3D build is not important,
> you can compile-test a particular module
> with in-tree build:
>
>
> $ make drivers/net/usb/qmi_wwan.ko

Yes, I know.  I use the M=3D build to do some basic load/run testing on
distro kernels.  Which is obviously a best effort thing. But it saves me
some time when it works, not needing to build and boot a more recent
kernel to just test a simple driver patch.


Bj=C3=B8rn
