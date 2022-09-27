Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F845ED03F
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Sep 2022 00:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiI0W0J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Sep 2022 18:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiI0W0I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Sep 2022 18:26:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964291CDB67
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Sep 2022 15:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=d8EJAmjmjZ/ULOV1Kn914cukTj85eQIB91jRsExRs6U=; b=ZWT2JDxu+N+eyyS2nMPl0cKjIO
        Q6HF3FEwic0cGz1NLb2O/vXKClrFdITIaSTlmTYBnMe4BYEOJWXYgSQMj/70RMeW6apODGtVZKIQu
        hB9kv3K3Ih4YWp50DlPKQyhHC22Wjhq/+xXbKMcJwIB/THRFxqe4GyrFg2jxLn2B6V9m//2o/M6OE
        nQlB3t5DtG8dwsG9/XfhlBkzQm1SAYf1tgMVv4kTt8NNQao6sy5AMI5MuVfke7dZaKb0COFmM1nWn
        C09VzE+art4CLf+S+aK4+WLwR/65JZ2zFjCuL/R/pyhZ+u++Ovnf5GvkiEpqVwqktvzX64v+4OZcE
        s2b4iShQ==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1odJ1d-00CuYK-A1; Tue, 27 Sep 2022 22:26:01 +0000
Message-ID: <e628cb91-0ed8-993e-7904-c7bf010b7462@infradead.org>
Date:   Tue, 27 Sep 2022 15:25:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] kbuild: rewrite check-local-export in sh/awk
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
 <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
 <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 9/6/22 02:28, Masahiro Yamada wrote:
> On Sun, Sep 4, 2022 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>>>
>>> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
>>> ---
>>
>>
>> Please input something in the commit log.
>>
>> I think the benchmark in v2 is worth mentioning
>> because "awk is faster than bash" is one benefit
>> of applying this patch.
>>
>>
> 
> 
> 
> Applied to linux-kbuild. Thanks.
> 
> 
> (V5 was not delivered to ML somehow,
> but I found it in my mailbox.)

Yeah, I haven't seen that one either.

For whatever is in linux-next-20220927, I am seeing something
unpleasant. I'm not positive that it's due to this patch, so I'm
still checking/testing (but I'm about to leave home for awhile so
I wanted to go ahead and let people know about this).

I do N number of randconfig builds in a script (say 10).
What I am seeing is that when an 'nm' error happens, the
script is Terminated and not continued. E.g., if the error
is on randconfig build #4, builds 5-10 are never started.
The controlling script dies.


>>>  scripts/check-local-export | 96 +++++++++++++++++++-------------------
>>>  1 file changed, 47 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/scripts/check-local-export b/scripts/check-local-export
>>> index 6ccc2f467416..0c049ff44aca 100755
>>> --- a/scripts/check-local-export
>>> +++ b/scripts/check-local-export
>>> @@ -1,26 +1,14 @@
>>> -#!/usr/bin/env bash
>>> +#!/bin/sh
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>  #
>>>  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
>>> +# Copyright (C) 2022 Owen Rafferty <owen@owenrafferty.com>
>>>  #
>>>  # Exit with error if a local exported symbol is found.
>>>  # EXPORT_SYMBOL should be used for global symbols.
>>>
>>>  set -e
>>>
>>> -# catch errors from ${NM}
>>> -set -o pipefail
>>> -
>>> -# Run the last element of a pipeline in the current shell.
>>> -# Without this, the while-loop would be executed in a subshell, and
>>> -# the changes made to 'symbol_types' and 'export_symbols' would be lost.
>>> -shopt -s lastpipe
>>> -
>>> -declare -A symbol_types
>>> -declare -a export_symbols
>>> -
>>> -exit_code=0
>>> -
>>>  # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
>>>  # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
>>>  # '2>/dev/null'. However, it suppresses real error messages as well. Add a
>>> @@ -29,43 +17,53 @@ exit_code=0
>>>  # TODO:
>>>  # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
>>>  # binutils to 2.37, llvm to 13.0.0.
>>> -# Then, the following line will be really simple:
>>> -#   ${NM} --quiet ${1} |
>>> +# Then, the following line will be simpler:
>>> +#   { ${NM} --quiet ${1} || kill 0; } |
>>> +
>>> +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
>>> +${AWK} -v "file=${1}" '
>>> +BEGIN {
>>> +       i = 0
>>> +}
>>> +
>>> +# Skip the line if the number of fields is less than 3.
>>> +#
>>> +# case 1)
>>> +#   For undefined symbols, the first field (value) is empty.
>>> +#   The outout looks like this:
>>> +#     "                 U _printk"
>>> +#   It is unneeded to record undefined symbols.
>>> +#
>>> +# case 2)
>>> +#   For Clang LTO, llvm-nm outputs a line with type t but empty name:
>>> +#     "---------------- t"
>>> +!length($3) {
>>> +       next
>>> +}
>>>
>>> -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
>>> -while read value type name
>>> -do
>>> -       # Skip the line if the number of fields is less than 3.
>>> -       #
>>> -       # case 1)
>>> -       #   For undefined symbols, the first field (value) is empty.
>>> -       #   The outout looks like this:
>>> -       #     "                 U _printk"
>>> -       #   It is unneeded to record undefined symbols.
>>> -       #
>>> -       # case 2)
>>> -       #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
>>> -       #     "---------------- t"
>>> -       if [[ -z ${name} ]]; then
>>> -               continue
>>> -       fi
>>> +# save (name, type) in the associative array
>>> +{ symbol_types[$3]=$2 }
>>>
>>> -       # save (name, type) in the associative array
>>> -       symbol_types[${name}]=${type}
>>> +# append the exported symbol to the array
>>> +($3 ~ /^__ksymtab_/) {
>>> +       export_symbols[i] = $3
>>> +       sub(/^__ksymtab_/, "", export_symbols[i])
>>> +       i++
>>> +}
>>>
>>> -       # append the exported symbol to the array
>>> -       if [[ ${name} == __ksymtab_* ]]; then
>>> -               export_symbols+=(${name#__ksymtab_})
>>> -       fi
>>> -done
>>> +END {
>>> +       exit_code = 0
>>> +       for (j = 0; j < i; ++j) {
>>> +               name = export_symbols[j]
>>> +               # nm(3) says "If lowercase, the symbol is usually local"
>>> +               if (symbol_types[name] ~ /[a-z]/) {
>>> +                       printf "%s: error: local symbol %s was exported\n",
>>> +                               file, name | "cat 1>&2"
>>> +                       exit_code = 1
>>> +               }
>>> +       }
>>>
>>> -for name in "${export_symbols[@]}"
>>> -do
>>> -       # nm(3) says "If lowercase, the symbol is usually local"
>>> -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
>>> -               echo "$@: error: local symbol '${name}' was exported" >&2
>>> -               exit_code=1
>>> -       fi
>>> -done
>>> +       exit exit_code
>>> +}'
>>>
>>> -exit ${exit_code}
>>> +exit $?
>>> --
>>> 2.37.3

Thanks.

-- 
~Randy
