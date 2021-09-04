Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6472400C7D
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 20:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbhIDSTe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 14:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58047 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237203AbhIDSTe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 14:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630779511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eTFJ/z23uhAgEiUhaPIzvjGnzGJZGxRWifNygGsPOgI=;
        b=PlWzQdn/VYquwj3Zy1+zsPsrdHmqHyfFxmwkz6W82crLZCTbwYg6pKzYDDKpatTpWyzB2L
        8fmnxKPte2nRylllVFHwaZc0eyLTbYyWUTP26GtLJncnDiyPylrCVcHcGmhr6jW1OGQG55
        pbfnoHZyVkM0W6YxNJxRoRv3LSD2XuA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-bCMUI5oGNrOzBOS1F8iC8g-1; Sat, 04 Sep 2021 14:18:30 -0400
X-MC-Unique: bCMUI5oGNrOzBOS1F8iC8g-1
Received: by mail-qk1-f200.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so4049641qkd.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 11:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eTFJ/z23uhAgEiUhaPIzvjGnzGJZGxRWifNygGsPOgI=;
        b=ajZSmgpr3zJT1mcMVVJuH8ml/1u6VwI0XUE6hGPsZuW50K8SVcURa5fRu/w/QyROEd
         hP1a19NtT+1rWJpbC0cwDzzArMpXILhNRtcqZ8CPwJERpToly5PDwLAoKUrk4aIJr24C
         iGbOcvmnooldQthugS3OnwNUCY+gcXLU5BK76o3qLXiDvsc7ZKxWqVyRSAXfvlK4pfpZ
         wz2ZX+Q9p1hkZpwU4lBmhlg9wmpvAVQkM4bRsNMYTijArTn+ZyPc3k9QXYYiGtUDJcjV
         +GqKfpaPTFDMTOGvwy2ApJD5ONlF1oribDohRa/ODOvaDON9WrmUN1RkH56xXIzUZrEA
         dziQ==
X-Gm-Message-State: AOAM530br71t4bZcSPDEGV0Pa9UZ06swHBwsgc4ke5A7gFx/c2yhO82+
        nYzdTxXB4VCWNLD3JK/gs8QKDQwYGyIFMmfrOxPG6UBqm0W1NQCHTZPDagyT+BwMsXJ1oNUGDSz
        NnKKbt231kuP1xdS5FxXpEJ/P
X-Received: by 2002:a0c:804a:: with SMTP id 68mr4992481qva.66.1630779510101;
        Sat, 04 Sep 2021 11:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVS9Nh2wSL5lnSoIEyNJcSfAick9YJ9gFMhOKEOQXbkL3UKT2x6G79oInn/A+Vjk23ZIBoPw==
X-Received: by 2002:a0c:804a:: with SMTP id 68mr4992465qva.66.1630779509951;
        Sat, 04 Sep 2021 11:18:29 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id s8sm1958102qta.48.2021.09.04.11.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 11:18:29 -0700 (PDT)
Date:   Sat, 4 Sep 2021 11:18:26 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] kbuild: move objtool_args back to
 scripts/Makefile.build
Message-ID: <20210904181826.shkpubse4fmd77ph@treble>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-2-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:52PM +0900, Masahiro Yamada wrote:
> Commit b1a1a1a09b46 ("kbuild: lto: postpone objtool") moved objtool_args
> to Makefile.lib, so the arguments can be used in Makefile.modfinal as
> well as Makefile.build.
> 
> With commit 2b1d7fc05467 ("kbuild: Fix TRIM_UNUSED_KSYMS with
> LTO_CLANG"), module LTO linking came back to scripts/Makefile.build
> again.
> 
> So, there is no more reason to keep objtool_args in a separate file.
> 
> Get it back to the original place, close to the objtool command.
> 
> Remove the stale comment too.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

