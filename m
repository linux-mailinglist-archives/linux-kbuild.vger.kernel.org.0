Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED8CA198961
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 03:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgCaBEH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 21:04:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40242 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgCaBEG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 21:04:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id a81so784814wmf.5
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fw2LMhqMpUKtHzYbQVOA9bjQOm3X2jbwN5CrhUGESVY=;
        b=rp3DjIoLk0LM8SIxOuGq5sbJ4rPhWrk5QsErQqD0bL+5tNrJg1LIvspg8AZyyH2r5X
         pT2ta0nzDwpHBnGmQiIEx1jxbjMA29SZzy1bFfQqrGCSSZN9DQWuoXn6Us3JRAg8GFj8
         t73zUdAnwyE7z/ECeluUAfhIpIrVCCmcewk9UKiDPXXZGHsG+IfrjQ4zQYxz6v8d0B7e
         hF7Ys/uNmD+HL1BhS8FgONzC2g6cdEcZukRTyMg4tKbiBp/Sg250tOJ+stSqXDeBHnF2
         w+4lJl8svCssSiM5FHbrphE8WZv4lMPVcSFbB9zdTUPoK5x2kkTnUjBxO9SPenWAlWoq
         sL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fw2LMhqMpUKtHzYbQVOA9bjQOm3X2jbwN5CrhUGESVY=;
        b=sD6VdkqnlE36lq8LYb46O6z9u/+7mY+Gn0uZWE+yv2ep6u39zmxCyZvIgpcLzBr2Fc
         SVAhqm8uRaab9ns26MQtVvWh9kz+pcmii0In56f/18vE10iR1aJNj+fpUbPb7Yh1C/Ct
         X1Pgd9IL1mK9Ydg308gXaZQgGINurxFLOu9IVEJ2t9TQY5NJuPCd89MDn3RvrQqi8ElV
         VXqGi5O58haKnTW1svg0VMbtewcDtK3B/y65WgPUjL57middPeyPJwly252MwzWQ3thd
         mU300rGWsqBtVE+bB7YHIYkgYhr0TP5dovciUA0GYT+/+FHzf5lWPXh7EFxV8IRpbRpx
         3PWA==
X-Gm-Message-State: ANhLgQ0vC9O3JtBMNUMJBdhmRO+FK4TaV6j+jDINiyckaXo8ZUfssnSj
        +GWVYA+0PrHz1IJxawh1rupmgQ==
X-Google-Smtp-Source: ADFU+vtYCmQdzinR/X4HVv2e1fA66xpIh+DJ9q+KLmplPTod3qQodOWbJsvtyYzoNNVwTL7nNnPfAQ==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr799219wml.154.1585616642896;
        Mon, 30 Mar 2020 18:04:02 -0700 (PDT)
Received: from cheddar.halon.org.uk (cheddar.halon.org.uk. [93.93.131.118])
        by smtp.gmail.com with ESMTPSA id y7sm27040892wrq.54.2020.03.30.18.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 18:04:02 -0700 (PDT)
Received: from bsmtp by cheddar.halon.org.uk with local-bsmtp (Exim 4.92)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1jJ5Jx-0001Yw-P5; Tue, 31 Mar 2020 02:04:01 +0100
Received: from stemci01 by c30-smcintyre.einval.org with local (Exim 4.92)
        (envelope-from <steve.mcintyre@linaro.org>)
        id 1jJ5Js-00016k-Lf; Tue, 31 Mar 2020 02:03:56 +0100
Date:   Tue, 31 Mar 2020 02:03:56 +0100
From:   Steve McIntyre <steve.mcintyre@linaro.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Frank Rowand <frowand.list@gmail.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Ian Lepore <ian@freebsd.org>
Subject: Re: [RFC PATCH v2 0/4] Add device tree build information
Message-ID: <20200331010347.GF4037@linaro.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <1b946fcf-47a9-012d-1b04-f4bbd2682607@gmail.com>
 <67d75f0c-7478-23b0-8619-746cf83cedb5@gmail.com>
 <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
X-attached: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-wibble: sender_address steve.mcintyre@linaro.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alexandre,

On Mon, Mar 02, 2020 at 01:55:55PM +0100, Alexandre Torgue wrote:
>On 2/28/20 6:47 PM, Frank Rowand wrote:
>> > This would require modifying every single main .dts file to get the build info
>> > I would prefer the method that Ian and David came up with (sorry, no lore link,
>> > it did not go to lkml).  Extract from David's email:
>> > 
>> >     Date:   Tue, 21 Jan 2020 13:05:25 +1100
>> >     From:   David Gibson <david@gibson.dropbear.id.au>
>> >     Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
>> > 
>> >     > Given that dts files are run through the C preprocessor before being
>> >     > fed to dtc, the build script could use the '-include' flag to force-
>> >     > include a fragment containing generated build info without any need to
>> >     > modify existing dts files.
>> > 
>> >     Uh... maybe.  -include will essentially prepend the forced file, which
>> >     is a bit awkward for our purposes.  It means that the prepended file
>> >     would need the /dts-v1/ tag, and we couldn't have it in the main files
>> >     which would be a bit confusing.  I think it would also cause problems
>> >     with any /memreserve/ tags and means that the main tree could in
>> >     theory overwrite the build information which we don't necessarily
>> >     want.
>> > 
>> >     I guess we could build things the other way around: have the main .dts
>> >     file specified with -include and have the dts on the dtc commandline
>> >     be a fixed one with the build information.  It'd be a little weird,
>> >     though.
>> > 
>> > -Frank
>
>Yes. I try briefly this idea but I got issues with dts-v1 tag. I agree, it is
>cleaner to not modify input dts file. I can rework int this way.

Have you made any progress on this please?

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

