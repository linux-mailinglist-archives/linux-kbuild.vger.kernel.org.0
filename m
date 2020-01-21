Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8770144108
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 16:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgAUPzC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 10:55:02 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47878 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgAUPzC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:55:02 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 00LFsjCx026239;
        Wed, 22 Jan 2020 00:54:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 00LFsjCx026239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579622086;
        bh=XcM8hwdOFSg2hY05tKp4+ZerG8dirnX+x/EnjTmei7U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HOttlFCxKUHUS3QQhft+gR1yh5ApFydDfUA74O858kpqGMBZuwhoU2TRiDa7viJDN
         T0YdGgyUDIlyMclVwAwVucCNQAUpkuYp3mQLIiGtRpe4W9P48tEogy1rR1x8KZeSCs
         OWJ2rCws1cUKtBcF0huZ8h8I9bZmULgJQ7TeJDvp0qwIT4L3DF7VYucqLf9AfZQQD0
         4MXgMQhi59s1GWz+sUMOcpZweejWirbyHxBHLPM+prfe5++Nkb89onmJDLmRudGMvC
         Q/BpGGaEfN6LqMxwyCcp3ap4z7Wn/SHApclvPNXP2JZbRaN7AZBb1gWY3IjCOPhMBb
         ql/wb9ieFZVhQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id p6so2090441vsj.11;
        Tue, 21 Jan 2020 07:54:45 -0800 (PST)
X-Gm-Message-State: APjAAAWZ5OmQB9DH22h1uterE8datDNFrtv0L4gl1uzR+JACsPZ6M7kv
        NBEFw9bKolSlHSNi/+rqZRgsPHCxdTTa1fKh6A0=
X-Google-Smtp-Source: APXvYqzimgj1k+UanmIO2Yl/8BmDDebyeC2VypYf7mojdWt9FnKycDESIAGbRvDXGOsDTCXOv+N4C05M31ODVcgtxBE=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr3090095vsq.215.1579622084742;
 Tue, 21 Jan 2020 07:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20200117161822.106635-1-helgaas@kernel.org>
In-Reply-To: <20200117161822.106635-1-helgaas@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Jan 2020 00:54:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4kVw1iE7zSypJ1wLnrrEEfRRd5YfH4m6aeXymF_2BfA@mail.gmail.com>
Message-ID: <CAK7LNAT4kVw1iE7zSypJ1wLnrrEEfRRd5YfH4m6aeXymF_2BfA@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: fix documentation typos
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 18, 2020 at 1:18 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix a couple typos in kconfig-language documentation.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/kconfig-language.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..0148ae82446e 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -594,7 +594,8 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>  Documentation/kbuild/Kconfig.recursion-issue-02.
>
>  Below is a list of examples of prior fixes for these types of recursive issues;
> -all errors appear to involve one or more select's and one or more "depends on".
> +all errors appear to involve one or more "select" statements and one or more
> +"depends on".
>
>  ============    ===================================
>  commit          fix
> @@ -656,7 +657,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
>  the deduced semantics matches our intended Kconfig design goals.
>
>  Having well defined semantics can be useful for tools for practical
> -evaluation of depenencies, for instance one such use known case was work to
> +evaluation of dependencies, for instance one such case was work to
>  express in boolean abstraction of the inferred semantics of Kconfig to
>  translate Kconfig logic into boolean formulas and run a SAT solver on this to
>  find dead code / features (always inactive), 114 dead features were found in
> @@ -683,7 +684,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
>  boolean formulas and run a SAT solver on it [5]_. Another known related project
>  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
>  has been introduced first with [9]_.  The basic concept of undertaker is to
> -exract variability models from Kconfig, and put them together with a
> +extract variability models from Kconfig and put them together with a
>  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
>  solver in order to find dead code, dead files, and dead symbols. If using a SAT
>  solver is desirable on Kconfig one approach would be to evaluate repurposing
> --
> 2.25.0.341.g760bfbb309-goog
>


-- 
Best Regards
Masahiro Yamada
