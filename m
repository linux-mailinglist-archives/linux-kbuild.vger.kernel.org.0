Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BFD178A60
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 06:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgCDFz0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Mar 2020 00:55:26 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:44226 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgCDFz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 00:55:26 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7851680558;
        Wed,  4 Mar 2020 06:55:22 +0100 (CET)
Date:   Wed, 4 Mar 2020 06:55:21 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
Message-ID: <20200304055520.GA28911@ravnborg.org>
References: <20200304032038.14424-1-masahiroy@kernel.org>
 <20200304032038.14424-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304032038.14424-3-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=T9RiHNw9UjFK13vW5GoA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro

Thanks for the nice improvements to the dt infrastructure.

Stealing a thread here..

>  It is also possible to run checks with a single schema file by setting the
>  ``DT_SCHEMA_FILES`` variable to a specific schema file.
Would it be simple to enable the use of dirs for DT_SCHEMA_FILES?

So I for example could do:

make dt_bindings_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/

I did a very quick look add it but failed to dechiper all the
makefile logic.

It is a corner case when one wants to check a full dir,
so unless it is very simple the current logic should not
be complicated by this (if you take the bait and look at it).

	Sam
