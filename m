Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972D81DEF26
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 20:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbgEVS20 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 14:28:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52235 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726373AbgEVS20 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 14:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590172105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z4chmSB75rF+W6Vhce5T0ZL8XsgMA5Bsyqy3UVYUZsc=;
        b=XCMCJEh9YiI1RdS8w3gUU2KRxtR7vTFSVAgxTw8g8jg5K8h3Nxp+hJGr90OTpZ2PSrm5d0
        BuJOcpKbm7rOUrgvdXGwgyWflUGcRY1zSm1QP+QoXvjLusD/ooHuTIKnSX0FeWg7gk74y4
        a9OZf3BeZv5UXfpUzGgnXa/RumcFIj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-M1BE3uvePMSB6PMXTwcLKw-1; Fri, 22 May 2020 14:28:21 -0400
X-MC-Unique: M1BE3uvePMSB6PMXTwcLKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C2E1855A00;
        Fri, 22 May 2020 18:28:19 +0000 (UTC)
Received: from treble (ovpn-112-59.rdu2.redhat.com [10.10.112.59])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8159CB9;
        Fri, 22 May 2020 18:28:17 +0000 (UTC)
Date:   Fri, 22 May 2020 13:28:15 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Huaixin Chang <changhuaixin@linux.alibaba.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org,
        tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200522182815.ezanmvbemhzq2fmm@treble>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 29, 2020 at 02:46:24PM +0800, Huaixin Chang wrote:
> Move building of fast lookup table from boot to sorttable tool. This saves us
> 6380us boot time on Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz with cores.
> 
> Huaixin Chang (2):
>   scripts/sorttable: Build orc fast lookup table via sorttable tool
>   x86/unwind/orc: Remove unwind_init() from x86 boot
> 
>  arch/x86/include/asm/unwind.h |  2 -
>  arch/x86/kernel/setup.c       |  2 -
>  arch/x86/kernel/unwind_orc.c  | 51 ----------------------
>  scripts/sorttable.h           | 99 ++++++++++++++++++++++++++++++++++++++++---
>  4 files changed, 92 insertions(+), 62 deletions(-)

I tested this (rebased on tip/master), it seems to break ORC
completely... e.g. /proc/self/stack is empty.

-- 
Josh

