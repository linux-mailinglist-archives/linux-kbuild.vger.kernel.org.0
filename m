Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6945365177
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbfGKFbI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:31:08 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63639 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfGKFbH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:31:07 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6B5Uplf029974;
        Thu, 11 Jul 2019 14:30:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6B5Uplf029974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823052;
        bh=1kECWKsjHiZrBfDgKoCp1WwU4/ibrj+5CihzDbiNBoo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=x8Pf2DcB1FH8Okvld1Qhzl3GrZGCGnenamoyOf/zMrlYKt51Le6uG5rW62SXJIgCa
         pFa7e7jUibhYgIFAF7Bh7oAde52RBnqnZkiFaS/AtEhntpvbuOva9LcvOI726OpsO5
         xRKuF/WApT9uWGxcB4faTO+kepFuq0ok3Qh8IQqtzC6qnf29ZOV+kAbGLYHcU7jBd2
         zX9oalsdCMZYG4ZQzB/1n58YVZuJnrAxiHeBxnInziM0xVtlA3p9ALmgjggEHiEc8N
         XKv71DXdWWuXQhFmslI7JuhL9AZs9N6Bw3ttL9/7xclYgn7T1J0sWE8yi/WXAthLXZ
         WVKNShOUIQUZg==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id z13so1855694uaa.4;
        Wed, 10 Jul 2019 22:30:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWOB6xam4kDQw/eMoCZilcs0ACQ97r0j1sM1frwweRmVIhWLqam
        rz3QPAKkh8OMR8ujTM6c+TM6Edzk33fV9M/qiTg=
X-Google-Smtp-Source: APXvYqxdlEn/pQc0q78KR9KuCtTZdWCqUi4biwcuKPied9YLnn+2Hy6P4XbUC7n6aoXyMN+CXwhkMc1viSe/oAc8w80=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr1296970uaf.95.1562823051136;
 Wed, 10 Jul 2019 22:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
 <20190709042416.27554-9-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 11 Jul 2019 14:30:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsdu_1mqS8CFt4jQsKZjnSaGaK7v=fsnzcqmrds=WMhA@mail.gmail.com>
Message-ID: <CAK7LNARsdu_1mqS8CFt4jQsKZjnSaGaK7v=fsnzcqmrds=WMhA@mail.gmail.com>
Subject: Re: [PATCH 08/11] kbuild: create *.mod with full directory path and
 remove MODVERDIR
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 10, 2019 at 2:37 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Tue, 9 Jul 2019, Masahiro Yamada wrote:
>
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -47,13 +47,10 @@ cat > "$new_ksyms_file" << EOT
> >   */
> >
> >  EOT
> > -[ "$(ls -A "$MODVERDIR")" ] &&
> > -for mod in "$MODVERDIR"/*.mod; do
> > -     sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
> > -done | sort -u |
> > -while read sym; do
> > -     echo "#define __KSYM_${sym} 1"
> > -done >> "$new_ksyms_file"
> > +sed 's/ko$/mod/' modules.order |
> > +xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
> > +sort -u |
> > +sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
> Did you consider the case when CONFIG_MODULES=y but no modules are
> selected?

I tested it, and worked.

 Also -r to xargs is a GNU extension and there were some
> efforts to remove theur use in the past (no idea if this is still a
> concern).


It worked even without '-r', so I remove it in v2

Thanks.




-- 
Best Regards
Masahiro Yamada
