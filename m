Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1194DC739
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Mar 2022 14:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbiCQNHl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Mar 2022 09:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiCQNHj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Mar 2022 09:07:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624115759C
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Mar 2022 06:06:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h15so7289610wrc.6
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Mar 2022 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=/c0Iug26q6VjeWZuRvSdzvpLlZxwZvT/Nmzo+p+K+ao=;
        b=eZvJA2MouwYF1H1sRuT0DonZ2l2qIjEARXHJEenO/M8SEytUYPyXaN1erP9Q0aaih6
         fdfa0HLOmZQZg53NzKL438iasjbWoKs95+LhSXo1eG9p74tuFlDemVE0D9sftGOpvJyn
         WQFOj94D46Cuo/r7R94eXdHtPeKMLlQ2geUTDdLyTq4+G2cgm+P0Iklmuo7YWqSFKhQj
         OxLsYDpkvYtrBc8VyDLNEIIYcLo5RkUxei7rxuImv06e0g31S6OU/RJSKvng9LiDTQ5F
         D0RidypRK/19QJN5pdOKM3JtnjBNtzYIzI7KiKa9/fgksOuWFvxyRbSNS2QzZDVP5xfj
         kmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=/c0Iug26q6VjeWZuRvSdzvpLlZxwZvT/Nmzo+p+K+ao=;
        b=48ldhAtZBVQ9zZTdyHuXUuQ0uqlvCGNXGeltGi+qDDgk/is2mYkSq67F8ORhxB52NP
         +3hd2+95t6Rp9RItZ2cqBCcG3Beo3csBZL6WqPGNcJyz2A33+gJEmH/EBdedErgahLiP
         V7KpK9uRM/deKwqQCacOcdjVLea6wJDJ4iOXIFz/SmqBdM8U9MT2dgv1q8HyJUR7lv7W
         itICUftKSM2peE/+fx1zEl8/rmippeM4yTJ5JWzc4NCVIYGvrrE7m1oqpfnG689ZPgjd
         ySJr+NEXiVXRN+ai1aiEnq49w0PN4fCr0zyszvNnG71YrJGrpnJ+UK1B0sws65TN2IC7
         J8Ag==
X-Gm-Message-State: AOAM530Ja2jnGYonGRyLrfSylJFGAGEcAtDR3dclPX5A0lgQyF88ivFZ
        TXFvNkJ86dYwzGIdzs7z4X4=
X-Google-Smtp-Source: ABdhPJyYBh2CjcWczuJafnZ9hiHLoC9iRWaw/9pHcYXOs0xfR4/5UudB1QvxJu+pLpsCcmlnwiOM/A==
X-Received: by 2002:adf:f811:0:b0:203:dade:ddba with SMTP id s17-20020adff811000000b00203dadeddbamr3987558wrp.439.1647522381991;
        Thu, 17 Mar 2022 06:06:21 -0700 (PDT)
Received: from DESKTOP-26CLNVD.localdomain ([197.210.71.246])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b0038c7626c454sm2263079wmq.12.2022.03.17.06.06.17
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2022 06:06:21 -0700 (PDT)
Message-ID: <6233324d.1c69fb81.c71b9.9149@mx.google.com>
From:   Barbara Finance Company <simondorcas708@gmail.com>
X-Google-Original-From: Barbara Finance Company <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Schnelles Kreditangebot
To:     Recipients <info@gmail.com>
Date:   Thu, 17 Mar 2022 06:06:12 -0700
Reply-To: barbarafinancecompany@gmail.com
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hallo

Ben=F6tigen Sie dringend einen Kredit?? Wir sind ein zuverl=E4ssiger, vertr=
auensw=FCrdiger Kreditgeber. Wir verleihen Unternehmen und Privatpersonen K=
redite zu einem niedrigen und erschwinglichen Zinssatz von 3 %. Antworten S=
ie uns unten mit Details, wenn Sie interessiert sind. Vollst=E4ndiger Name,=
 ben=F6tigter Kreditbetrag, Kreditdauer, Land, Telefonnummer, kontaktieren =
Sie uns jetzt unter: barbarafinancecompany@gmail.com
