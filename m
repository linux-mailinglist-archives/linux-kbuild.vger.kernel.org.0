Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D003C58C28C
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Aug 2022 06:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiHHEcS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Aug 2022 00:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiHHEcG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Aug 2022 00:32:06 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC88F959E
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Aug 2022 21:32:04 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 2784VWPh003563
        for <linux-kbuild@vger.kernel.org>; Mon, 8 Aug 2022 13:31:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 2784VWPh003563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1659933093;
        bh=2jLUnR9cMLago4Xbut6kZNDj+vjmmgZuyrHtLq3MI6c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QmRayufv1NMtebCCKr6wHrTO9BAb7KxZAVhXboik0hdgURGCBRJ+E4lIJURXJEs1C
         xCHr2HZ4Jil3s5pqyUiS68MaCcI98J8806g+FMtdsHtUEFVQ7YENNj/5MXO2dGX4AN
         bp6zRgdyBqka0QQ19T0jdG6+rlHKWW0jmbYab7DDUs7Y06iccw7koN1+YllvHkxNgD
         P4Mpc3rFVZbRtKzyAMACcWB3W1t+rf7wh34l5ZsPt7yM+soRefjm/iybKqnuXlgOOL
         /mzcNdTvp+Fc73iq97AVcZJls81Avkc9aCNJiM8KdlKg70tTtn5XSol/QMumq61vsa
         XKiXrAvoVIYkA==
X-Nifty-SrcIP: [209.85.221.49]
Received: by mail-wr1-f49.google.com with SMTP id z16so9457036wrh.12
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Aug 2022 21:31:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo0K4BlH2yttDqwj+6///ZIJC2TMVZdd30ExirX0CBesdDj0iMui
        5yrgmOcozvviCxx98qzotYp4xlJqksiMURwFZqI=
X-Google-Smtp-Source: AA6agR6rL7YZFeFQmbeuU3ir+Hj6LnmeQZpS5zdpelfzs4BGHl9hxgDvpkUCLLDZmj8g8mGjElIZbXb6Y/FBjHDy0zI=
X-Received: by 2002:a05:6000:1f9a:b0:21e:d4a7:a4c0 with SMTP id
 bw26-20020a0560001f9a00b0021ed4a7a4c0mr10167566wrb.409.1659933091348; Sun, 07
 Aug 2022 21:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <18a919882d8aa7b8970888a565ebbbeefdce9f12.1659465303.git.owen@owenrafferty.com>
 <CAK7LNASEEU1-GqH1BiwU5P3L0kF5vwQ2WQ4njZrHQt0Z9ok47g@mail.gmail.com> <YurWv4VQbMNICK8/@niobium.localdomain>
In-Reply-To: <YurWv4VQbMNICK8/@niobium.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 8 Aug 2022 13:30:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+4fOkJ5WDb9t5qXCqS+GhnbnG8wBffxNa1ZJ3=4Ps3Q@mail.gmail.com>
Message-ID: <CAK7LNAT+4fOkJ5WDb9t5qXCqS+GhnbnG8wBffxNa1ZJ3=4Ps3Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rewrite check-local-export in posix shell
To:     Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 4, 2022 at 5:12 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> On 22/08/03 12:40PM, Masahiro Yamada wrote:
> > On Wed, Aug 3, 2022 at 3:49 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> > >
> > > Remove the bash build dependency for those who otherwise do not have it
> > > installed. This should also provide a slight speedup.
> >
> > I do not know if this is worth the effort,
> > but do you have any benchmark on how fast it is?
>
> To be clear, I'm not asking for every single bash script in the tree to be
> rewritten in posix shell -- it was only this script that made bash a hard
> dependency (on x86 at least).
>
> For a configuration suitable for my system w/ 4 HT cores:
>
> bash
>     real8m 47.79s     user54m 30.91s    sys13m 56.88s
>
> sh (dash)
>     real7m 34.94s     user46m 42.63s    sys11m 54.02s



You need to explain what command you measured.

But, never mind. I did it by myself.




With x86_64 defconfig build, I got  2824 objects.

$ find  .  -name "*.o" | grep -v vmlinux | wc
   2824    2824   78929


Without your patch,

$ export NM=nm
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
./scripts/check-local-export'

real 0m58.816s
user 0m30.772s
sys 0m31.420s





With your patch
$ export NM=nm
$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
./scripts/check-local-export'

real 8m22.922s
user 7m53.015s
sys 0m30.147s





So, it is the opposite.
Your patch makes the code extremely slow.
More than 8x slower.


+       type="${symbol_types##* $name,}"
+       type="${type%% *}"

This code is really slow.
















> > > -# the changes made to 'symbol_types' and 'export_symbols' would be lost.
> > > -shopt -s lastpipe
> > > -
> > > -declare -A symbol_types
> > > -declare -a export_symbols
> > > +symbol_types=""
> > > +export_symbols=""
> > >
> > >  exit_code=0
> > >
> > > -# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > > -# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > > -# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > > -# hand-crafted error message here.
> > > -#
> > > -# TODO:
> > > -# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > > -# binutils to 2.37, llvm to 13.0.0.
> > > -# Then, the following line will be really simple:
> > > -#   ${NM} --quiet ${1} |
> > > -
> > > -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
> > >  while read value type name
> > >  do
> > >         # Skip the line if the number of fields is less than 3.
> > > @@ -46,26 +26,40 @@ do
> > >         # case 2)
> > >         #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
> > >         #     "---------------- t"
> > > -       if [[ -z ${name} ]]; then
> > > +       if [ -z ${name} ]; then
> > >                 continue
> > >         fi
> > >
> > > -       # save (name, type) in the associative array
> > > -       symbol_types[${name}]=${type}
> > > +       # save (name, type) in "associative array"
> > > +       symbol_types="$symbol_types ${name},${type}"
> > >
> > >         # append the exported symbol to the array
> > > -       if [[ ${name} == __ksymtab_* ]]; then
> > > -               export_symbols+=(${name#__ksymtab_})
> > > -       fi
> > > -done
> > > +       case ${name} in __ksymtab_*)
> > > +               export_symbols="$export_symbols ${name#__ksymtab_}"
> > > +       esac
> > >
> > > -for name in "${export_symbols[@]}"
> > > +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > > +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > > +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > > +# hand-crafted error message here.
> > > +#
> > > +# TODO:
> > > +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > > +# binutils to 2.37, llvm to 13.0.0.
> > > +# Then, the following line will be simple:
> > > +# $(${NM} --quiet ${1} || kill -INT $$)
> > > +done <<EOF
> > > +$( ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill -INT $$; })
> > > +EOF
> > > +
> > > +for name in $export_symbols
> > >  do
> > > -       # nm(3) says "If lowercase, the symbol is usually local"
> > > -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
> > > +       type="${symbol_types##* $name,}"
> > > +       type="${type%% *}"
> > > +       case ${type} in [a-z])
> > >                 echo "$@: error: local symbol '${name}' was exported" >&2
> > >                 exit_code=1
> > > -       fi
> > > +       esac
> > >  done
> > >
> > >  exit ${exit_code}
> > > --
> > > 2.37.1
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
