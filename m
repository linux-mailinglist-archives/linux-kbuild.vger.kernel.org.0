Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0220C19C73C
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 18:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389871AbgDBQkD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 12:40:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38421 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389046AbgDBQkC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 12:40:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id c21so2005298pfo.5
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P5P7+32EPNiTA9W/bPQnunX4XIHQIJgt5gQH7DdKhy0=;
        b=fH8o+GZDZ1xdsVdHSi6MAupKO7i5SOOdhKbMy9EC42AcredyeAYuEr60QU+fttr6C7
         M2hu1qmBT0E9kEN76oM60aZ/2lEdUGRNSJhnMJgML3APaBmfOp6cNgas0HOFLn7YCJ9t
         RwvAvDwKlwACh5Y2WaH8SYappE+KxFzPYG22EvIPo0pYp4eYGp52pNwS8JUBHX39jpGn
         KyyV+sycOit5HZK8sukkfuVL/Bfn0cBmW79zilVLgTeAKHW5n0VQGehTG0J11yLPVzKS
         JdSyKtBiFPzQ7ho0Qfjc201wn6fV1KNo4fb4K4jM1Jya+7jxx7diX9cQyFo2tgDVbssA
         TyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P5P7+32EPNiTA9W/bPQnunX4XIHQIJgt5gQH7DdKhy0=;
        b=jMpOCmIRPOlzn3e+XKtOsu1EgOUXEfpNiochDyQ1HX3A6dClgvoOcnn4xE2+mJu4jq
         Tj/BpIuZYUhoR1iMVF37TMiJ6hqdXeupxDu1C2OGXtS0331Ia3XdK9VhxFcy2ClnlioU
         LjTiWkpf1wngMu0OElBz7tcccIgm+WQorg1hEwiGJwFSByb3+ppctOD+/1tfCbquMQK+
         2UkC/kgjOZ2nkn2X3QphjlbUAOHlUqAGJ8BYRMGtL74mZk8w89KHV4BQl/C/vNQlMkDt
         xHYitTv1iOeT/SQHYRJhAk5/vdHRh7JRjLgM1hecd/BFTUwd1WbWQEuyDhMnmfKdGIet
         K0Ag==
X-Gm-Message-State: AGi0PuZs7vC3mphpm1qw94OIGF+kHQVnSjUTRK9RbN0o2AxGK1foLXzA
        FsT7MKs+kA94N89uTik+Ic/9KQ==
X-Google-Smtp-Source: APiQypKH0DXiDCoSWxCJ+loJoi3QVtbfhkTZ6FkNR9ShOim7iSVt2e1XqX4CIaEPQbwY6vh2ItkDDg==
X-Received: by 2002:a05:6a00:c8:: with SMTP id e8mr3777718pfj.131.1585845601274;
        Thu, 02 Apr 2020 09:40:01 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id ci18sm4102094pjb.23.2020.04.02.09.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 09:40:00 -0700 (PDT)
Date:   Thu, 2 Apr 2020 09:39:57 -0700
From:   Fangrui Song <maskray@google.com>
To:     'Nick Desaulniers' via Clang Built Linux 
        <clang-built-linux@googlegroups.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Message-ID: <20200402163957.lqgr3tpc4z7ish5e@google.com>
References: <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
 <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86>
 <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
 <CAK7LNAR0PPxibFVC5F07mytz4J2BbwQkpHcquH56j7=S_Mqj2g@mail.gmail.com>
 <CAKwvOdnYXXcfxWT6bOZXCX9-ac8tb=p2J53W+T-_gOfUu9vvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdnYXXcfxWT6bOZXCX9-ac8tb=p2J53W+T-_gOfUu9vvSg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2020-04-01, 'Nick Desaulniers' via Clang Built Linux wrote:
>On Tue, Mar 31, 2020 at 11:11 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Wed, Apr 1, 2020 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>> >
>> > On Mon, Mar 30, 2020 at 11:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> > >
>> > > Having both LLVM_DIR and LLVM_SUFFIX seems verbose.
>> >
>> > I agree, so maybe just LLVM=y, and we can support both non-standard
>> > locations and debian suffixes via modifications to PATH.
>>
>>
>>
>> OK, so we will start with the boolean switch 'LLVM'.
>>
>> People can use PATH to cope with directory path and suffixes.
>
>Sounds good, we will modify our CI to use PATH modifications rather
>than suffixes. We can even do that before such a patch to Makefile
>exists.

The proposed LLVM=1 + PATH scheme looks good to me.


There seems to be one issue.
OBJSIZE=llvm-objsize added in
commit fcf1b6a35c16ac500fa908a4022238e5d666eabf "Documentation/llvm: add documentation on building w/ Clang/LLVM"
is wrong.

The tool is named llvm-size. OBJSIZE is only used once:

   arch/s390/scripts/Makefile.chkbss
   14:     if ! $(OBJSIZE) --common $< | $(AWK) 'END { if ($$3) exit 1 }'; then \
