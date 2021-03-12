Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1B5338317
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 02:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhCLBTb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 20:19:31 -0500
Received: from pb-smtp21.pobox.com ([173.228.157.53]:53760 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhCLBTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 20:19:30 -0500
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 7ED5312D4EA;
        Thu, 11 Mar 2021 20:19:25 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=Tflsr+pFN7bsoUlPi5vEKVYQZ00=; b=OOzUfy
        KR4tPWhjnsEd7BqUYQUw5VZGQI/N6BcVPHUwKSOyaobYDJ+GyX/7NZ69ku6sZMOv
        to1lhxSQuMT6ISO2IQoiuhSUYATpiUwqITtgpvAxsDWaLeBEYFDT/VJuo9WUo1m4
        S7usEKDE+EuP9Iv1cnbRlN9aJx/yBF/wzDJlk=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 76F8D12D4E9;
        Thu, 11 Mar 2021 20:19:25 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=8Y4tISx9JtvPwheWVqOA1yet+FMGrYmjDlVphbkup2o=; b=etAf4Pw5RO5mO4Dt38gY2H9qe1IMfp0uZAp3KC6n6jPE4lEInH/pe+uXf7HhhtEJuk2Qt6jkGpxctzTy3+Um9IdyidP2RVaUfsU4cEt0lhucnQiWLeEvras/x+MC5k2f+e86KRpULawJiQ2apXN3stdnNm0vJGT5gAIil8MpIOA=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 79EC512D4E8;
        Thu, 11 Mar 2021 20:19:22 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id B6B052DA0024;
        Thu, 11 Mar 2021 20:19:20 -0500 (EST)
Date:   Thu, 11 Mar 2021 20:19:20 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        =?ISO-8859-15?Q?Bernhard_Rosenkr=E4nzer?= <bero@lindev.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: collect minimum tool versions into
 scripts/min-tool-version.sh
In-Reply-To: <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
Message-ID: <32or985-8s52-17pr-62qq-s1q3r13p12no@syhkavp.arg>
References: <20210311094624.923913-1-masahiroy@kernel.org> <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: FA10F8AC-82D0-11EB-AE2E-D609E328BF65-78420484!pb-smtp21.pobox.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 11 Mar 2021, Miguel Ojeda wrote:

> On Thu, Mar 11, 2021 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > +# When you raise the minimum version, please update
> > +# Documentation/process/changes.rst as well.
> > +min_gcc_version=4.9.0
> > +min_llvm_version=10.0.1
> > +min_icc_version=16.0.3 # temporary
> > +min_binutils_version=2.23.0
> 
> +1 to creating a central place for all minimum versions.
> 
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> I wonder if you considered creating a folder with files like
> `scripts/min_versions/gcc` containing the version string. That would
> make it easier for reading from other languages or even importing them
> dynamically into the documentation, thus removing even more
> duplication.

Alternatively, the documentation could be the actual reference and the 
script would parse the documentation to get those values out.


Nicolas
