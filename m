Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A157A63FA8A
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Dec 2022 23:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiLAW0J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Dec 2022 17:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiLAWZ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2022 17:25:56 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97213201B8
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Dec 2022 14:25:55 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id c15so2860686qtw.8
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Dec 2022 14:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iijkfmMowBw7EgvyU/A1XvB3x24pEXd1fGbeKwBA104=;
        b=xLns+SrrIxRmfV1aSNCcjbsOCur459+8ohgdcao9tW6kh8lfpPDjyR0TE/CgoOSxnP
         73aw0ArEsb0ZhGi5BQTWoaNM/JsJiISge/aLU3yh/lX9iCrSxd6wAHqX5vPf3VTsw9Z1
         OoShQBUdq3IC+Q63tKVipYgaSqgiLCuhm3Bw4hDcn2wMGSMEKyuc7pEFHN4I26w9qNP2
         /6rMuGbKm1+GOB5lW8gXCc3h6kDa3tKOmUtsNTWx0Op2UZ7nDUM3U5ry4UeStp3j0yuo
         VzVLUrN76wwiZxCGYIp4JmAt1C2+BF3fkEY08eJffXwIae7G2GbMTShWuplZSZb36iV8
         +ItA==
X-Gm-Message-State: ANoB5pkZcE4BzvMeFJaV4STUURmDOPxugTEf71FVrGOQnvkrlGbXq/Z8
        k35YZkzNAOFZB0mF/revB8qeEpAud0NwcKK2GEISk+jb
X-Google-Smtp-Source: AA0mqf4c5m/DdjJJ3+kI7iGePaChVAp1fUPPc6AI/Jp3+zWpmoV6g/R+6KRYZXVfqIepd8Jh+/7vVj7J75kvdELthc4=
X-Received: by 2002:a05:620a:132c:b0:6fa:774:2822 with SMTP id
 p12-20020a05620a132c00b006fa07742822mr47661776qkj.410.1669933554733; Thu, 01
 Dec 2022 14:25:54 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
In-Reply-To: <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Thu, 1 Dec 2022 17:25:43 -0500
Message-ID: <CAG+Z0Ct6J-qe3RYyVmKZ0OhZ7jsnw0modP5taFk19d3ryCmLeg@mail.gmail.com>
Subject: Re: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 30, 2022 at 6:23 PM Masahiro Yamada <masahiroy@kernel.org> wrote:

> So, this patch does not work for Make 3.82.

indeed.

regards, Dmitry
