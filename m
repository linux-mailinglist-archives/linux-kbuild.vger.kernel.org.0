Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9673C68ABC7
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 19:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbjBDSEo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 13:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjBDSEo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 13:04:44 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713E12C664;
        Sat,  4 Feb 2023 10:04:42 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5254e8994e8so63483207b3.6;
        Sat, 04 Feb 2023 10:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VtLrK5mDClTq29iCeH6nxeIx59oVNFrwL0qes88aptI=;
        b=cn0IgpDIzzDw8YFc8mzpzUPUgS98COSHp6BJIKudYRQ6HQ4Xi/2uWhdyshs1gcWBC3
         N2ixSkyl1ufhsUNsyDLXd/l1os8LTQNTTnbduTOEzFLx1kHUq6+1KnTb81AiLAMfn/o0
         OVd3V3rKU69pzLXU7aNUXLYZm+bayPYORPcG7l5W76jMHsheq1eOchvJ61QjnLxyEHQD
         Gki0HBgw5Hallpv3bqh079Chn3+PU+64zBCcVcwIX/iDHMKjDK8V9w6iueBwbay3SXSF
         m4MotzElJQYASqY91qP0Rvh3z+M0DPHGSG7Pxfont9rfYVtAAL46gtA7r3Sh2tH9XMOY
         5k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtLrK5mDClTq29iCeH6nxeIx59oVNFrwL0qes88aptI=;
        b=oRgj1NKbVdPEXQzO3FO63ZFSfkLS5brBRkSNvDcrID9WuKVQbgRaFjPI08itFHn+7s
         0zbA40Kbbxs6lp2IV6Wadb6n5JzoADap5YHqWzNfM5osrgnR2sBXqhdHI6cTejovSGV2
         bp6Uy80W4CCOLMk3a1VQiK5q6Vx1dSGzuf2339UcUCa6+fCGVoQToBVAqM0peaHwbTu+
         UREEu5g+5OTnzGwBx2Yxlf01eQGNdDJkgpzKwWPMtlL7622cA8QukE9qqkOLTONlv4Gi
         j4239x++xj+gE6vpVsYueQH3dL2nq8mRBWiSmhP/CZ3sJokAxcL/PFaZLP5C/SCOmOSv
         i19Q==
X-Gm-Message-State: AO0yUKWKIlNjmjs2M8nbBC/N2LktlPgP8WEm/tvnDggfPcmBvpP5DIvx
        2pL3hwXQpydQuzHTrN5K7MYsciMZdQteYS6xncc=
X-Google-Smtp-Source: AK7set8pqRqxN+KeXhaSfOy7vWpkuBMquOHpLvBfFXipgR8g3XGm6jRwtWlEom8m8kfB4SzZC1R6IaIjkZduOQGIr8M=
X-Received: by 2002:a05:690c:c08:b0:3d8:8c0e:6d48 with SMTP id
 cl8-20020a05690c0c0800b003d88c0e6d48mr1211997ywb.462.1675533881632; Sat, 04
 Feb 2023 10:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20230203173704.108942-1-mcanal@igalia.com> <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
 <CAK7LNATqPK+weiRwjKzQazQ7usu+GXbx4tz7q10Yaajn+6=dDg@mail.gmail.com>
In-Reply-To: <CAK7LNATqPK+weiRwjKzQazQ7usu+GXbx4tz7q10Yaajn+6=dDg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 4 Feb 2023 19:04:30 +0100
Message-ID: <CANiq72k1b6xmeS=9bkcSuoPuPXmdEgzjpNCKxaj=fZKUzfxQVw@mail.gmail.com>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 4, 2023 at 6:59 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Miguel,
>
> Are you applying this to your tree,
> or do you want me to pick this up?
>
> For the former case,
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks! I was about to apply it, but let me know if you prefer otherwise.

Cheers,
Miguel
