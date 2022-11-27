Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3E6639B8E
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Nov 2022 16:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiK0PhL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Nov 2022 10:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiK0PhK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Nov 2022 10:37:10 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3684DEB1
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Nov 2022 07:37:09 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id i12so5871647qvs.2
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Nov 2022 07:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWn1H2wut0bpXF+6gWs1e4RvffBYdSkkZX/PkuR/kbk=;
        b=0BBQb+17LGW1WsYHBjZ6zom4MspZygwKrHcQvB4X1lOQThZ/NeC0qaB7gsJf2WBwOZ
         uFnsbLMTMohgo1+223iimcEPOLTKi9qrVzfhXrK7XnLcDaFiHgkZw0zcUBtnqpFVj5OI
         uibw+08c1WYBpOBqsuaZdGppDEPu0NorfDZ+MI3boMXv38IMRAy3cc3FdXYNK/k4HTXM
         oMFdEOOali72Zl7CdNVh60dF/rS/xznYTLMRQ6oEXLeIKzETilP2ly/rzy1bH4ZJpyO7
         qFPMhGWob5oKGVyYV6YW8tHfMxpWdUxmpeJPKdz2DdQFIECkmNyhjz+WMDL1W+xbszBj
         8CXg==
X-Gm-Message-State: ANoB5plc8B2HBr208rKA0EcPvhSfRxJ+phSskI/zQ47cVXwTQfztsrDH
        DqbMeD151AeeQVq8GzkDvC5S2lmyvIsXD9n1MgCxCt9Ux2w=
X-Google-Smtp-Source: AA0mqf5JTCJfURPXEPKzTgwEWwoDbr0r658HFS6oyIvHfg4DHon/lW3FNKfmpNCVk7KB7pX77VRf7J4070SG5rqw9vc=
X-Received: by 2002:a05:6214:3c9a:b0:4c6:141f:819c with SMTP id
 ok26-20020a0562143c9a00b004c6141f819cmr26299616qvb.76.1669563428735; Sun, 27
 Nov 2022 07:37:08 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
 <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
In-Reply-To: <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Sun, 27 Nov 2022 10:36:57 -0500
Message-ID: <CAG+Z0CtZCzhvKuEev64w-8sT11fxNPd2vw=tOOGTBDJvRFjuZQ@mail.gmail.com>
Subject: Re: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 27, 2022 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Please come back after your patch is applied
> (and please have the patch include the commit hash
> causing the behaviour change)

Will do

> BTW, the GNU Make manual suggests $(word 1) instead of $(firstword).
> Is it for the purpose of backward compatibility for older
> Make versions?

Paul chose $(word 1) for this example. i am not sure if there was any
specific reason. $(firstword) would do the same.


> The kernel build only supports Make>=3.82, and I personally prefer
> $(firstword).

3.82 had firstword. Will replace $(word 1) with $(firstword).

regards, Dmitry
