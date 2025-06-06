Return-Path: <linux-kbuild+bounces-7386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A98AD0668
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 18:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD68188DCBC
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 16:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430881DE2BD;
	Fri,  6 Jun 2025 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ggG20+VT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38614AD2B
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Jun 2025 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226002; cv=none; b=NvcsPwJzaerD8ziGtVCXwUoLjolMVjIeydYIBQ/Z9/8Qg7lyRatmlufxGJuKG88L1VALPBAf1kE7bKs4KbMeYze+QJY8f7/I8mXco+/dheB4DJA24GofAvvvaB/gLmHNr9FmsY82Gle2GLR+wOxbc4Nr10PfEiTF7mHSc0Bb3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226002; c=relaxed/simple;
	bh=LKdBO63sIvnKo0SoLVGTMLUEgo8cUHzl1SXzymedqbk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=akOlcs7F/zMXP5D3potmE+iTsI+J6DmdOhUEBuiziJ8ktdMS09ih7C1Dg2cr+J58XeBM5dCNk+LzF75td9P9ueAjSkYu+KXm8TaGVhH7It7RMoR0oCP/qRlzYyiGNo7GffTHFzqPrkp1BTMZzWpPepNAQwb8ezaWJZz2wfeXsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ggG20+VT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235e389599fso269185ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jun 2025 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749226000; x=1749830800; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yTKdu5aL/9ZsYpub978sOVY3e3OCJrYQ4VVZY1nfnZA=;
        b=ggG20+VTx17+iPR2ZeF/hs5q/aXub0QmcUDTttodq+lBIzF0fZH6hneun6/zWwlG7B
         cTnViE9sN75zaoFSNYpjpv28HnUBEV5IMnkI8wRiC7TmAiu/xshhwJWAgf/8szoMtJ0S
         9anga8/z4VADmLd553mMqP6EUuDB3zduQkaxLAOL5TiYPYXGyO4acvGpkOYHX4FKapXq
         aOcJ58dHSKLW+q8+G+DblMHbUvCqmLQwJDhGdPfiDEoCyevHn7lPcIrNB46xU3YQqDAZ
         mmRWDzCc4r/i/ySyTHC+no8xsFO1HiaItFaKTwdvbNw8+sb48hAWGO8+5VZXN58XG5Ut
         4kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226000; x=1749830800;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTKdu5aL/9ZsYpub978sOVY3e3OCJrYQ4VVZY1nfnZA=;
        b=QynUZisuwjETaLjQ/2KCZQGvipeb4DcXrB9YVAMkJEO9MyDNcVAGEQOUHGDlUP0Hzz
         9iZXJVePZnEQb5Z7vuG56nLlhcn6au5L3tiVvFcWjI+SfSYNKywb/4TgP7Q8THz323HZ
         +1yQ+YsyWsNe6D9KGDrR+OtdPgmmIob2MSqmXqFZHEV+UaCF9l7Z7/E+YCss48hbyYtp
         CVFbG5KRUs+Ws0drGsV2qRjOCVHGABho4G2PYIKMOYmTZvra/4QAh+Mc7VgX4UTEvJNq
         qc7jkHB8Nfj9D/qxLLOkmMuM9u++Gi+WxPWWSZ74zkJFJ/ohtKtJKHFr9xgdPKje640e
         sXgg==
X-Gm-Message-State: AOJu0YyTis9ytPkw+UG23m5OJb3s9VVRWyFbhGPevpxvzRskew2ZrR3/
	uf+h8GcO4SPRIMoAWBl53r2gocXJawIGTBxj+wumlmBsChtaLmKFSoG19HWK71Dtbvi09jpQTMx
	ewEwX01QEawreQWXo46lZUf7pADT4vLHdlMIBXj1BL9wirvP8GMz6jaZhHds=
X-Gm-Gg: ASbGncu2bl3qf7+r9VjS6/dVo6mwL/MHPWngJkq/5IEtOzyaykOeIBapu1uWOuwmiIi
	pNETlOvz04kNDA3xOCMQEp4fTcLk9OnavNpOD4Ysu0xDagFMfXzrxyJQnSuhQW34UQLCZQ8wKfV
	GnbmuFnxhKp959ThdZt7Wa8Ip4+18tSvYH2AQSvhaWKClsqD73Et46EolPRymW2/hNfZpk2Jmm3
	g==
X-Google-Smtp-Source: AGHT+IG4B+anGhEc1D932dA4ErU+MaECF0MiQ0hFqaNsVUDkRogmJqW3YubeAqxvir7AAAWAFiTp4yi8tpMDGcRALAM=
X-Received: by 2002:a17:903:188:b0:235:e8da:8e1 with SMTP id
 d9443c01a7336-23602350955mr3629455ad.18.1749225999284; Fri, 06 Jun 2025
 09:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anish Moorthy <amoorthy@google.com>
Date: Fri, 6 Jun 2025 09:05:00 -0700
X-Gm-Features: AX0GCFugPi-c3ss--TlcdRp9X8H9e39vYI8ayy0b0vseDWpKaOtdSYcjVqSEFjI
Message-ID: <CAF7b7mo6g46zJMPPBfiUrNosBC+t3TKwWCBCUkh55f+6MiYQBA@mail.gmail.com>
Subject: Generating .cmd files without actually building the kernel?
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Does anyone know/have ideas on how to do this? I'd like to be able to
generate compile_commands.json and browse the kernel code without
having to build the whole thing.

It seems to me that the basic change/hack should be something like
[1]. But of course, it's not that simply just applying that patch and
then running "make defconfig; make" runs into an error pretty quickly

> $ make defconfig
> $ make
> ...
> ./scripts/basic/fixdep scripts/mod/.empty.o.d scripts/mod/empty.o '${GCC_COMMAND_HERE}' > scripts/mod/.empty.o.cmd; rm -f scripts/mod/.empty.o.d
>fixdep: error opening file: scripts/mod/.empty.o.d: No such file or directory
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
> /bin/sh: line 1: scripts/mod/empty.o: No such file or directory
> make[2]: *** [scripts/mod/Makefile:25: scripts/mod/elfconfig.h] Error 1
> make[1]: *** [/usr/local/google/home/amoorthy/linux/Makefile:1271: prepare0] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

I take it the gcc command itself is generating the .d files, which I
guess makes sense given the existence of gcc's -MF flag (though grep's
not good enough for me to figure out where we're setting thins). I
tried

> $ make CFLAGS="-E"

too under the theory that this would generate the .o.d files, but this
just dies elsewhere

>  exec-cmd.c:2:10: fatal error: linux/compiler.h: No such file or directory
    2 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
> compilation terminated.

Anyways, I've spent a fair chunk of time trying to understand the
system at this point, but I'm really still just fumbling around:
figured I'd try asking for help.



[1]
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e24..a17cdfa7ab72 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -208,6 +208,10 @@ cmd_and_fixdep =
                           \
        $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
$(dot-target).cmd;\
        rm -f $(depfile)

+savecmd_and_fixdep =
           \
+       $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
$(dot-target).cmd;\
+       rm -f $(depfile)
+
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4d543054f723..9fcb41f96d89 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -318,7 +318,7 @@ quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
                $(cmd_objtool)

 define rule_cc_o_c
-       $(call cmd_and_fixdep,cc_o_c)
+       $(call savecmd_and_fixdep,cc_o_c)
        $(call cmd,checksrc)
        $(call cmd,checkdoc)
        $(call cmd,gen_objtooldep)

