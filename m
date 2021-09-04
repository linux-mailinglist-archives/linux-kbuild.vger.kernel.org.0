Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF3B400CC3
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 21:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhIDTFQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 15:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48318 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhIDTFQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 15:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630782253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8iBLYJMftUwp7hXO2s0oIif0u5EZOHD9H+Oe1M0SPII=;
        b=DfyEYJb94xXWvw0bdj2Qwt2GZlotouuK0ber62//upvUBZu/wskte5peFvNwRt2+ax5dUe
        WcQaRemS+XUJDW9X8jGarLLraF895voPzyh6+cJfAEQOHioajhBmztS+z/FfcAQZVFmwGq
        GMtvOyuX1zr18W4KPNP4Px9QL/3EX6E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-DZxK9Qz6NHum7KoQlC4uMA-1; Sat, 04 Sep 2021 15:04:12 -0400
X-MC-Unique: DZxK9Qz6NHum7KoQlC4uMA-1
Received: by mail-oo1-f69.google.com with SMTP id w20-20020a4a7654000000b002917fdff67fso1651210ooe.2
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8iBLYJMftUwp7hXO2s0oIif0u5EZOHD9H+Oe1M0SPII=;
        b=TiVwwcRTqxylhZEpgJo4uswHxBIH2uir42cfYFmsRbzg6Dj99y2Z1UoBQVA0pk/rIs
         uD3LlGP49jLRozYVSX3LOXSiyM64asiRGp6GM9k9+hbNXVnLBkFE/BP1hcqt6pzBfPXl
         LrDAxJsf3ZN26Jq4anlTCRzPHzsmY4F65norwUpW/tBnK6RgGFoFD1JETHMxw3BWPM0s
         2js0DK01vtrgL/vaKH/KV+UMR6dRvX8YOgu6F8SURS0g6JGNfLDD0K8uTlSOmpwww/1Q
         dJQWndaQRJAvFbFrW6X/L4QrnjyGGSMNZqK0Wg9PyYvx/BL3QVojD6t84XoCgT5uSdML
         7PRw==
X-Gm-Message-State: AOAM532lO9rb2ZvpFlKwOO3TwJwg0GIC5G9dmEtvGrbARUL2QnOe0Iw/
        7Aif5M2tehx5lTHP4ZfP77sT9TZ2VVYPchrbWGD4hrqpKuDu4RgrYQE8hd3hDTTDx6G65N7V0Ab
        ihfMEe0p93WiOPOeIOlxzJ+BB
X-Received: by 2002:a9d:4042:: with SMTP id o2mr4133431oti.332.1630782251641;
        Sat, 04 Sep 2021 12:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPB60KqDp75uk3gd5sXgmkng+nzBElGb2AZWYXj7JFmqsg7DcMcmTQT46CTWXzkJvtpOfoKQ==
X-Received: by 2002:a9d:4042:: with SMTP id o2mr4133417oti.332.1630782251450;
        Sat, 04 Sep 2021 12:04:11 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id l21sm663379oop.22.2021.09.04.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 12:04:11 -0700 (PDT)
Date:   Sat, 4 Sep 2021 12:04:08 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/13] kbuild: detect objtool update without using
 .SECONDEXPANSION
Message-ID: <20210904190408.gslbmm44a5rhknny@treble>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-6-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-6-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:56PM +0900, Masahiro Yamada wrote:
> Redo commit 8852c5524029 ("kbuild: Fix objtool dependency for
> 'OBJECT_FILES_NON_STANDARD_<obj> := n'") to add the objtool
> dependency in a cleaner way.
> 
> Using .SECONDEXPANSION ends up with unreadable code due to escaped
> dollars. Also, it is not efficient because the second half of
> Makefile.build is parsed twice every time.
> 
> Append the objtool dependency to the *.cmd files at the build time.
> 
> This is what fixdep and gen_ksymdeps.sh already do. So, following the
> same pattern seems a natural solution.
> 
> This allows us to drop $$(objtool_deps) entirely.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

