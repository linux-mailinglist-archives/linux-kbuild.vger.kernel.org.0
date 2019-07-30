Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C2D7A185
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 09:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfG3HAB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 03:00:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42428 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfG3HAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 03:00:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so14546445wrr.9;
        Mon, 29 Jul 2019 23:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JE7kx2iX5slOmbDpS9tRcc6buuuGUkhZXzUOl8pd6t0=;
        b=D5e3cRz+VK0ioIpA8syxWkRs/Q2i3rnwVd3i4x2WuA8t5oJV8DoFEVluUEs1SXm3mD
         hEMEXN9Ko5GCu/8CheHW/rEeeH1voi0Wu6Qy2vRlGxjW43YKOWOtSf+v4MhN9KK1IS1F
         9KFnIUbOOC7OIrKbm1WyMZGevsZrj9adxGDVlPdQLC97HDLbZg8RmMYYlPWmNM/K3QRS
         iH+4vEPqKCWz3c1WfRej6MPqikBeJuek1DIJYpxRttqJBqwczJj6x1tnCHHbwM6NMQiU
         VbziQ7VVbcaZmYcZfI4lrnkjnZDArspDmBkcZmB4jMStebNjaT9PjLQbqPi/Aj2xzTzp
         q/FQ==
X-Gm-Message-State: APjAAAUkgQye6eHS3gAQLc9ilKrnxXlMi3wfIDChNViRKTZYtn6TBVmW
        9d7/upXD2CEAOcLkKLTFRZCj4vh4jWI=
X-Google-Smtp-Source: APXvYqxPjH5qmMeDEp6RD1kqPY35v3O3HX+Qo+VfHllrE8p5WR101dWEEWtDfNXOkQ/YEN2e1CmqyQ==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr96052874wrv.39.1564469998600;
        Mon, 29 Jul 2019 23:59:58 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id f204sm96203686wme.18.2019.07.29.23.59.57
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 23:59:58 -0700 (PDT)
Subject: Re: [PATCH v3] modpost: check for static EXPORT_SYMBOL* functions
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190714152817.24693-1-efremov@linux.com>
 <20190729141801.31333-1-efremov@linux.com>
 <20190730082618.5bb5edf3@canb.auug.org.au>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
Date:   Tue, 30 Jul 2019 09:59:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730082618.5bb5edf3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 30.07.2019 01:26, Stephen Rothwell wrote:
> Hi Denis,
> 
> On Mon, 29 Jul 2019 17:18:01 +0300 Denis Efremov <efremov@linux.com> wrote:
>>
>> This patch adds a check to warn about static EXPORT_SYMBOL* functions
>> during the modpost. In most of the cases, a static symbol marked for
>> exporting is an odd combination that should be fixed either by deleting
>> the exporting mark or by removing the static attribute and adding the
>> appropriate declaration to headers.
> 
> OK, this is now in linux-next and I am getting what look like false
> positives :-(
> 
> My powerpc builds produce these:
> 
> WARNING: "ahci_em_messages" [vmlinux] is the static EXPORT_SYMBOL_GPL
> WARNING: "ftrace_set_clr_event" [vmlinux] is the static EXPORT_SYMBOL_GPL
> WARNING: "empty_zero_page" [vmlinux] is the static EXPORT_SYMBOL
> WARNING: "jiffies" [vmlinux] is the static EXPORT_SYMBOL
> 
> empty_zero_page (at least) is not static.  It is defined in assembler ...

This could be fixed either by adding the type, for example:
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -478,6 +478,7 @@ EXPORT_SYMBOL(phys_base)

         __PAGE_ALIGNED_BSS
  NEXT_PAGE(empty_zero_page)
+.type empty_zero_page, STT_OBJECT
         .skip PAGE_SIZE
  EXPORT_SYMBOL(empty_zero_page)

Or by updating the check in the patch:
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1988,7 +1988,9 @@ static void read_symbols(const char *modname)
                 unsigned char bind = ELF_ST_BIND(sym->st_info);
                 unsigned char type = ELF_ST_TYPE(sym->st_info);

-               if (type == STT_OBJECT || type == STT_FUNC) {
+               if (type == STT_OBJECT ||
+                   type == STT_FUNC ||
+                   type == STT_NOTYPE) {

Do I need to resend the whole patch or create new "patch-on-patch"?

Denis
