Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA29733ABB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 07:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhCOGlV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 02:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhCOGkz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 02:40:55 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331CFC06175F
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Mar 2021 23:40:55 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so1477543pjb.0
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Mar 2021 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lDgFJiFzkALDNWJm7eIQALO66wKkLjr8e5CGYouyH9Q=;
        b=vxg3eiHaUzzokoIRbIOsTMbEDkyQd3FqU57/Q43Ck+dCgIf1WAnjGb9NyCrTRt7CJD
         uk+aUyIgyk0GnD8jHUpNRo5uDGZ3LgBNHGNF4S7um9zWitOmiIw8K/fldSleJQfqbXwB
         JUfSDmdDzqrOMdygefJ03PYQGYk1aBmUeeO1AwmFeZDktkjsVdRMs2Dt1WI03oSZhS8E
         i5FrDTPoiWyusj1hhRGLCFBB9CQVxxjJ6B694Z97o9FqJkHsUBsCpyhliw5YL6pDsHsj
         d9Gl0A12fDh8g641TA85wMtCPFUDUtxyGfmKcHh//3TyLLXNZSUUmES+aVql8g/7o5zJ
         mCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lDgFJiFzkALDNWJm7eIQALO66wKkLjr8e5CGYouyH9Q=;
        b=S9biMmd3VmNcpe/JGyuz58LZ2hSCxq3Jw+kwQS9BN/fx+44NzcyQNlIozSthKpxvX/
         DE380fUWtFfBDAl/oESa7u5T8HVL4+oJEYDDNyXc0aWuCvEk0NilZuqFYosWCaOieRyu
         Ipn3URk8pBSvTX4IUgvIu972lzMhs0+9S8/mFJw3uGRkEe6KiZSEuIZV15PEruLxe94t
         8IOUXrXtYiG1VVXrE+aVsBSNQdueFEAPiJDEt/avjKlIld7JYcEtyL6u0Pj4hXloMr3W
         6YcgkupCjs0m8lA36+IwOryNJlpwumWtmecmmLcA+Q/fHrVxaxrf/ZpSVqDnIDmhjDLy
         Vhwg==
X-Gm-Message-State: AOAM531LPfm8S7Mlz4sL45XsrVuFbhME53bqCnLLgrvgD3t6oDFfOHE2
        3EkyEY0IUgP2xfDw//k2ZcdL9w==
X-Google-Smtp-Source: ABdhPJyawDJzg6z4jlQ27AM7B9mQihetA2HK15PDd5+BUmBZxGxIWePelSfFNIpbbtmMwPVuFK17Wg==
X-Received: by 2002:a17:902:c382:b029:e4:7015:b646 with SMTP id g2-20020a170902c382b02900e47015b646mr10771208plg.83.1615790454561;
        Sun, 14 Mar 2021 23:40:54 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id g2sm12134089pfi.28.2021.03.14.23.40.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Mar 2021 23:40:53 -0700 (PDT)
Date:   Mon, 15 Mar 2021 12:10:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 14-03-21, 20:16, Frank Rowand wrote:
> On 3/12/21 11:11 PM, Frank Rowand wrote:
> > On 3/12/21 1:13 AM, Viresh Kumar wrote:
> >> On 12-03-21, 01:09, Frank Rowand wrote:
> >>> I suggested having the .dtso files include the .dts file because that is a relatively
> >>> small and easy change to test.  What would probably make more sense is the rename
> >>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
> >>> file create a new .dts file that #includes the corresponding .dtso file.  This is
> >>> more work and churn, but easier to document that the .dts files are a hack that is
> >>> needed so that the corresponding .dtb.S files will be generated.
> >>
> >> What about creating links instead then ?
> >>
> > 
> > I don't really like the idea of using links here.
> > 
> > Maybe it is best to make the changes needed to allow the unittest
> > overlays to be .dtso instead of .dts.
> > 
> > Off the top of my head:
> > 
> >   scripts/Makefile.lib:
> >      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
> >      overlay data in section .dtb.init.rodata, with a label
> >      pointing to the beginning of the overlay __dtb_XXX_begin and
> >      a label pointing to the end of the overlay __dtb_XXX_end,
> >      for the overlay named XXX.  I _think_ that you could simply
> >      add a corresponding rule for %.dtbo.S using a new command
> >      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
> >      __dtbo_XXX_begin and __dtbo_XXX_end).
> 
> If you do the above, please put it in drivers/of/unittest-data/Makefile
> instead of scripts/Makefile.lib because it is unittest.c specific and
> not meant to be anywhere else in the kernel.

What about doing this then in unittest's Makefile instead (which I
already suggested earlier), that will make everything work just fine
without any other changes ?

+# Required for of unittest files as they can't be renamed to .dtso
+$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+       $(call if_changed_dep,dtc)

-- 
viresh
