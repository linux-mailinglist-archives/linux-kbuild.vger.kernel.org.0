Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFED400CCC
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 21:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbhIDTOr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 15:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44599 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232424AbhIDTOr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 15:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630782824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WBSi8nTL2nbxE9L6Uzaa8E6icfUP8Id4bMZJ4LABMcs=;
        b=ixuLt+hhkWcRicDEHH9io1A6MOHio6lmV1DArVNYyVwgWlJB73uI2IVFc6pWvotCqwY6kH
        kw0V33KHD9a+rgQifHplH+kb00WtHskBW6VTXCyDt3dTsl3WfIjJy6ocH0zNYQPXkhFcHS
        zA9TYduqQwLvBFcya+cFMoQrdsrfXW0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-JztKpsuGMRuCIZXGUFfK2A-1; Sat, 04 Sep 2021 15:13:43 -0400
X-MC-Unique: JztKpsuGMRuCIZXGUFfK2A-1
Received: by mail-oo1-f71.google.com with SMTP id e26-20020a4ada1a000000b00290b0695382so1682094oou.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 12:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WBSi8nTL2nbxE9L6Uzaa8E6icfUP8Id4bMZJ4LABMcs=;
        b=pxS2F0MtZxxDOhrA/f0OMEMfdGM3IAPITnvGK5gqCSa92nlLsbYKqT6sOA9U/IMmqk
         lnCkCR86BPD9wwcA95EwdE6Vhe7So6qVcQXoteGImP2xL9Rof91Od+Zh5Tcdvd4qcVmp
         gXqYe0H1ZhOKBhFKIFThPHdH9qMctEOGy6/UKVWTHemILWPQ4BFDk1aPfoN/cPWuumTw
         /W3CeWLnMqq3Vw/db/cu2BwSQ/8kZOMx9AYo6O2hcNSgkC/ajIseveG77T3ZuaAv3E1k
         FVdsKiKLeK2iF7kVmnDUNeGmxG6GTlGbo86g6MEQFOjuyumGsnrVVepHNADLcf1ugaTP
         eLpg==
X-Gm-Message-State: AOAM530sgWpnHq30onUd6wKX6EmVmw8rucxJCVPV/caSGAcuNsaTIuxm
        CqOKTp/Fz+DSzQglPK01UWA0fw8hqUsbY2tY9Yq/cJJU2aF7d6v6Xsp6/P4FH/SI2x5C+RB62bd
        suzpLXpZ6ecK4QS379NQOazQM
X-Received: by 2002:a9d:720d:: with SMTP id u13mr4667149otj.14.1630782823069;
        Sat, 04 Sep 2021 12:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF5y2tVBMPpoLH4B70xM59WXmh/BXOSlAd/YoXQygqVdu/1nyQ3742hphAQN2uKBGNiPURcQ==
X-Received: by 2002:a9d:720d:: with SMTP id u13mr4667132otj.14.1630782822839;
        Sat, 04 Sep 2021 12:13:42 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id a11sm625630oiw.36.2021.09.04.12.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 12:13:42 -0700 (PDT)
Date:   Sat, 4 Sep 2021 12:13:40 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/13] kbuild: rebuild modules when objtool is updated
 for CONFIG_LTO_CLANG
Message-ID: <20210904191340.yuce2pnh4fahxfpf@treble>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-11-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-11-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:40:01PM +0900, Masahiro Yamada wrote:
> We rebuilt objects when objtool was updated, but only for non LTO
> builds.
> 
> For CONFIG_LTO_CLANG, the objtool step is postponed by the link time,
> and nothing happens even if objtool is updated.
> 
> Add the proper objtool dependency to the pre-modpost module link
> for CONFIG_LTO_CLANG.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Nice!

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

