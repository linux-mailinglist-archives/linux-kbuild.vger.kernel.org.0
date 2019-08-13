Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81218C46C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 00:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfHMWol (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 18:44:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbfHMWol (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 18:44:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0468920644;
        Tue, 13 Aug 2019 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565736280;
        bh=Q1SBCLuk/eXT833KidghUxUJuZoa13F78s+hx7KlVTk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E0veT3UCpaljsgDtSBIV7fWR2Y50DXBJZd0cVcG2BzDr+2YMjU0t/U0a1ddjfzNEs
         cLtxpFHAO09LoW2OOD36eDgn9zOzoqWEOvZra1U+67jwO2ClwEHoH0YgPHhTZA9RFC
         jI+ueSNiZpbC7dDADwImJobWWnbyChdcCgDDC7bI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
References: <20190813183825.9605-1-sboyd@kernel.org> <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
Subject: Re: [PATCH] devicetree: Expose dtbs_check and dt_binding_check some more
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 13 Aug 2019 15:44:39 -0700
Message-Id: <20190813224440.0468920644@mail.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Quoting Rob Herring (2019-08-13 15:32:48)
> On Tue, Aug 13, 2019 at 12:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > It wasn't obvious that this was a command to run based on 'make help',
> > so add it to the top-level help for devicetree builds. Also, add an
> > example to the documentation to show that db_binding_check can be run
> > with DT_SCHEMA_FILES=3D to only check one schema file instead of all of
> > them.
> >
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: <linux-kbuild@vger.kernel.org>
> > Cc: <devicetree@vger.kernel.org>
> > Cc: <linux-doc@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >
> > I didn't find this sent, so sending again!
>=20
> You had. :)

Oh no, sorry! :(

>=20
> >
> >  Documentation/devicetree/writing-schema.md | 1 +
> >  Makefile                                   | 6 ++++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> writing-schema.md got converted to rst, so I fixed up and applied.

Thanks!

