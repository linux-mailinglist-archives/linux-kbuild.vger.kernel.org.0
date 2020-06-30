Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8356920EB1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 03:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgF3Bwo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 21:52:44 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60299 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgF3Bwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 21:52:44 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05U1qCct029907;
        Tue, 30 Jun 2020 10:52:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05U1qCct029907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593481933;
        bh=pzUnP+Gd/o71cSKBNMVmFDAQhku4dhuHdwm+GTsm+dQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Z/YKjt+0I8CwnlcfGXxiM76xxMtgFODo0Udz4VqTd6CKBsUlq7XA5yMEetuHdo/pW
         3HgcfiV3FXbjk4H5APsgullI7XFlYZH390On8SQhyFpcoeIOjG2bMcCSVFbhJbIX3E
         8+db+cuS2ytCwlhWgryth1k4QWye5Q8yR8L73VqlvFzs/OnXZVGNWTrtGffqyan/T3
         c3xglyXCTMosaiY9EyEDWn++HE/rzV/+ACOEa7SP4b/bjLp9cOc6bnK8Izc4lPALRH
         HVDYxsOgzIBea+GDhgLewH6bLT/SjbM528NNV6UkbcQMIkoCuux6e8hwAy+x1SZpNg
         IS0m+3H8FlYIw==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id c7so4503116uap.0;
        Mon, 29 Jun 2020 18:52:13 -0700 (PDT)
X-Gm-Message-State: AOAM53041HppmKQUPQD8jyxOk3j3WiJgB8pqz53RbYKOvlskWLVVRdMq
        wSy0CKfTkxtBO4vAfs6JIi8Jybxu4aQpAN+rbrI=
X-Google-Smtp-Source: ABdhPJx34KgJOS3yCKldjTe3z4RlrwFHHKAIReVcj4g+8cBmyLg1qxOv+ce1XT52RH9evjclhDuFnFDuKvDgX3lnJiU=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr12963596uae.121.1593481932354;
 Mon, 29 Jun 2020 18:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200625170434.635114-1-masahiroy@kernel.org> <20200625170434.635114-5-masahiroy@kernel.org>
 <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
In-Reply-To: <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 30 Jun 2020 10:51:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzG5ty=knL4eh=8w43p57BGMf6mRMTR1rPrhdFoKs7YA@mail.gmail.com>
Message-ID: <CAK7LNAQzG5ty=knL4eh=8w43p57BGMf6mRMTR1rPrhdFoKs7YA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: split DT schema check rules
To:     Rob Herring <robh+dt@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 30, 2020 at 5:50 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Jun 25, 2020 at 11:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > When building %.dt.yaml from %.dts, two things happen in a row:
> >
> >  [1] Run DTC to convert %.dts into %.dt.yaml
> >
> >  [2] Run dt-validate against %.dt.yaml
> >
> > Currently, when any .yaml schema file is updated, processed-schema.yaml
> > is regenerated, then both [1] and [2] are rerun for all .dts files.
> >
> > Actually, we do not need to rerun [1] since the original .dts is not
> > updated.
>
> I have plans (and an intern working on it) to integrate the schema
> checks into dtc. That's going to make turning on the schema checks
> just a flag to dtc. I'm not sure if adding the complexity here is
> worth it as I'd expect much of this patch to go away again.
>
> Is there any negative impact on the absolute clean build time? I'm
> more concerned about that than optimizing rerunning.

No benefit on the absolute clean build time.

OK, then please skip this patch.




-- 
Best Regards
Masahiro Yamada
