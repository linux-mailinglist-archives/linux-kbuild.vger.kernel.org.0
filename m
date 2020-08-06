Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0848823DBE4
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 18:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgHFQfs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 12:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgHFQfY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 12:35:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9355C0A893C;
        Thu,  6 Aug 2020 08:08:16 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id i26so32073921edv.4;
        Thu, 06 Aug 2020 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/NBVKOjlAWWfsV7g9wQU/wL49LI80XYT8ZZs5+X9WF4=;
        b=X0/iNYVseeiv7KKCcoHOOF+EgAeIK3Jhiqd/cqA341huobn7TndXq1Xkph67VmiIIQ
         pL8KNuqR9x09+LI3pU1gcxrBk4ffIub0jP2cj9GfKvNY+c1QALaWRd2uSovGRaO8fhiP
         uyJkUPPDA4ggB3mgn0K4MiFUaU5ZAzJC1IqwqJH8IY+Vm9rAeRqdYPnGgZjXQPZAUX9d
         lD/yHm37Y7GShrMpO60wOb2AzykPpn0tbk5EkF4BExNpSy7MJV9U8YDZ6YOdHvEVzF09
         Ri/5Vn9xpo2XomBE4jkhZbLdHRmTK6kEZrCsJnNzvKEhYhjBRYE9ILZzFDCs93li9gil
         qPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/NBVKOjlAWWfsV7g9wQU/wL49LI80XYT8ZZs5+X9WF4=;
        b=gBugjOcQ68WL+pel+9/6nwRgCh31FJlMPaogSCwghNSUpiC+iFj8IREXiVIcFQKONo
         YSm4ik2UzVqcNkAoJ0j4/py66+b5L7xTPv5ri8wwxf+eW4vjpScvrDXREFopr5SxZ0Jb
         B62UIZPleEAyEDeibqHhYKOTSlHC+/lRo9TDhHaYis3Pr83k8HaaeoXk8RQhjQIh8N/q
         uISll/xFlFqiEA+hiX6BGDNI4VHKh3OmLzphKDdYCCWUq6KlSrSEBA/OD3VPDfO9yPKO
         WJAMEl1L5NDmh8DSqORAM6s/l9c1NZGaIWiPKbODCfkwU1ULdQeRYangKHSyN0QuwMZe
         cBXA==
X-Gm-Message-State: AOAM53283/BerG7oWJIXavA7PkYScGK16Jc2cgAM+u2K5q+c55lICrN8
        mAmeGZbjv+Vpr1hIoQXZiQg=
X-Google-Smtp-Source: ABdhPJx4tglb5q6BahdDY6UfNDnLH/fg9q5/lMjer49/21DCpLvr0dFIv9J/IPh1tHwgokZaqFNpmg==
X-Received: by 2002:aa7:c74f:: with SMTP id c15mr4558837eds.331.1596726495566;
        Thu, 06 Aug 2020 08:08:15 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id 4sm3886474ejn.84.2020.08.06.08.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:08:14 -0700 (PDT)
Date:   Thu, 6 Aug 2020 17:08:10 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     changhuaixin <changhuaixin@linux.alibaba.com>
Cc:     bp@alien8.de, hpa@zytor.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, luto@amacapital.net,
        michal.lkml@markovi.net, mingo@redhat.com,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        x86@kernel.org, yamada.masahiro@socionext.com, jpoimboe@redhat.com
Subject: Re: [PATCH 1/3] scripts/sorttable: Change section type of orc_lookup
 to SHT_PROGBITS
Message-ID: <20200806150810.GA2127855@gmail.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200723034643.33537-2-changhuaixin@linux.alibaba.com>
 <2714DF66-5F65-4CB1-A232-B88E4D5AF566@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2714DF66-5F65-4CB1-A232-B88E4D5AF566@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* changhuaixin <changhuaixin@linux.alibaba.com> wrote:

> Hi, Ingo
> 
> Another way to write SHT_PROGBITS is using elf_create_section to write orc_lookup table headers, when orc_unwind_ip table and orc_unwind table are written. Is this a better solution?
> 
> diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
> index 3f98dcfbc177..860d4dcec8e6 100644
> --- a/tools/objtool/orc_gen.c
> +++ b/tools/objtool/orc_gen.c
> @@ -183,6 +183,10 @@ int create_orc_sections(struct objtool_file *file)
>         u_sec = elf_create_section(file->elf, ".orc_unwind",
>                                    sizeof(struct orc_entry), idx);
> 
> +       /* make flags of section orc_lookup right */
> +       if (!elf_create_section(file->elf, ".orc_lookup", sizeof(int), 0))
> +               return -1;
> +
>         /* populate sections */
>         idx = 0;
>         for_each_sec(file, sec) {

Looks much nicer IMO.

Mind turning this into a proper patch that does it plus reverts the 
hack?

Thanks,

	Ingo
