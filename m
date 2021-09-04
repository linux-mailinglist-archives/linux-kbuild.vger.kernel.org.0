Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371C5400C7F
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 20:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbhIDSUT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 14:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55160 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234085AbhIDSUT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 14:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630779557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lQxLXG+tLC8/gQrf0gKeWEplwFmOd9QxR9rHZUvrWfY=;
        b=LzyoB0PzwSZXKZZVAKXAY483IUE0CmhgqY5fI3/FhriONhMAiOKhgpoVnb4wpEPZvuRfWk
        3fAR8ocNzeveCS+yejqIxRroU+54/DIRIJFkpz7HV+S0nsupbbfqX1husvTHNUQTZ8hd46
        D31blkrzMUVEbFWKm0ISfOnKL1BLsYw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-rE8owUZwO1i8wbo0xlHXjA-1; Sat, 04 Sep 2021 14:19:16 -0400
X-MC-Unique: rE8owUZwO1i8wbo0xlHXjA-1
Received: by mail-qk1-f198.google.com with SMTP id h135-20020a379e8d000000b003f64b0f4865so3935556qke.12
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 11:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQxLXG+tLC8/gQrf0gKeWEplwFmOd9QxR9rHZUvrWfY=;
        b=OqlWLNot+WZeVYkp5DlkYzjf84E5Yv1twGqc3Cb+78x2XZv7EeHdSy0Alu/Z71wDgA
         zdjXlXDGq5j2vy28K7JrrVQfBMgKCrAEbiw9ySH5xYXApcSg9hRY60NoCstEsMFiTW+g
         ldaD0UtIqL2LI1xJTgaD5o8LnuKMnOHjB8ZFrHv19XLhxLYVEX0U+o85IHgkjaMSWETX
         Lm3YnDXxiwXT1fG+DwcUaCx55ukfT34T5kTxgWji1rqLflhzLoNP+XlJkBPZJsDo1TW/
         H+ugiigWyCFWIos/K0W0vHExMNcuy1cWSXh52Il7f+kWRp6yE/zye12jF01d7VVFvjO8
         qmsg==
X-Gm-Message-State: AOAM531psN4s7itcKf1FhYlU2n0/Y/44u+TIg2XdOHvWbdOvbI/kImKp
        tumAFdBjQ9yd8wdO3gRGrgLkOUYDvzm+PVqlPZ5GX3UIY1E8DvWMO/Op4pK+n+levlDAepXQQsj
        Y5NGMjEBphkrSlLHxv5pw3ke2
X-Received: by 2002:ad4:4f50:: with SMTP id eu16mr4957044qvb.27.1630779555729;
        Sat, 04 Sep 2021 11:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvX20+tN9yheBPI5jvjmprAVNHtW9v0MeFxBOaHYR8VeV+71mHDcJZjGt1jc05yuGs2vSzZA==
X-Received: by 2002:ad4:4f50:: with SMTP id eu16mr4957035qvb.27.1630779555587;
        Sat, 04 Sep 2021 11:19:15 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id v10sm2089344qkj.79.2021.09.04.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 11:19:15 -0700 (PDT)
Date:   Sat, 4 Sep 2021 11:19:12 -0700
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] kbuild: rename __objtool_obj to objtool
Message-ID: <20210904181912.r5hgjrpkle3jvm5k@treble>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-3-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:53PM +0900, Masahiro Yamada wrote:
> Rename __objtool_obj to objtool, and move it out of the
> 'ifndef CONFIG_LTO_CLANG' conditional, so it can be used for
> cmd_cc_lto_link_modules as well.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

