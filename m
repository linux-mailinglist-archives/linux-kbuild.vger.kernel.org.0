Return-Path: <linux-kbuild+bounces-7217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1123AC057B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0F91BA743C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD4D22331E;
	Thu, 22 May 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYZANZLF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65C223313;
	Thu, 22 May 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898277; cv=none; b=LxKwGO6kS/ChIHHhRUr/rPAsRdEQoZz8252a+x/OPBCAlAcCiC2rCCUXOn1OT5B7UPeQ1SFuMRfwcLDLmBAXGTWEj9p27HupLpzB/O6q4qGhwyVM7T5k4qC9Jg0QQaepAxmBLKMszB/DwGNkhydATcoSjjkm9XNE4KfoB906l6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898277; c=relaxed/simple;
	bh=RBfEx3162mbB+OlkOVLAYGSIHMmdR4c1LkTJqUJI4rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Emi8qh+S9i6f8/73Xc7dGG48/ZCKxaQQ6DuezBslzV64BiT9I7JijQCmcAN48DQLvxRiWl1s8Q/sLIJKo2YQd0Fao7OJaSOnyyYj78ymZRqTN/OWqXwKfERZGUvYON7u0W5Vm348CKu1sT+yeLucV7xBHBoqg+z1R+oZmq0vGPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYZANZLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4D7C4CEE4;
	Thu, 22 May 2025 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747898275;
	bh=RBfEx3162mbB+OlkOVLAYGSIHMmdR4c1LkTJqUJI4rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AYZANZLF1q+VpvyppqfCbYcdVmCTUt1BG6bjVEm1vkMYS+tA6MauObDFwHmEvXXYl
	 tqJ7sbVdb2kFRIFvUzQd4pZJemTWv0sfZJnRfr1/H7HJfXTVR6S9Sb6jiRwZGjaPbs
	 0g5sTSoxYVWHYMl3b75edj3CISgLu3o30HlsXzRxGMNwns4/mHgp6fiP9wWQBOmyEg
	 TG+i723euNjbiEqbD7Dysg2kvKNI1UEaC6/02q68FvmjiYkPe/XkOFd55kgg8Y3Swd
	 nN5Ss+YPQvcgiLEN5i1a7ICPE6VWeIg8l+N07wxjY4NTMupMPi4H4nG7DjmcWdw7VT
	 WeXQYTpGsCKPA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthias Maennich <maennich@google.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] docs/core-api/symbol-namespaces: drop table of contents and section numbering
Date: Thu, 22 May 2025 16:17:22 +0900
Message-ID: <20250522071744.2362563-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522071744.2362563-1-masahiroy@kernel.org>
References: <20250522071744.2362563-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit

The manually updated table of contents and section numbering are hard
to maintain.

Make changes similar to the following commits:

  5e8f0ba38a4d ("docs/kbuild/makefiles: throw out the local table of contents")
  1a4c1c9df72e ("docs/kbuild/makefiles: drop section numbering, use references")

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/core-api/symbol-namespaces.rst  | 45 +++++++------------
 .../it_IT/core-api/symbol-namespaces.rst      | 32 +++++++------
 .../zh_CN/core-api/symbol-namespaces.rst      | 41 +++++++----------
 3 files changed, 47 insertions(+), 71 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index c6f59c5e2564..f7cfa7b73e97 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -6,18 +6,8 @@ The following document describes how to use Symbol Namespaces to structure the
 export surface of in-kernel symbols exported through the family of
 EXPORT_SYMBOL() macros.
 
-.. Table of Contents
-
-	=== 1 Introduction
-	=== 2 How to define Symbol Namespaces
-	   --- 2.1 Using the EXPORT_SYMBOL macros
-	   --- 2.2 Using the DEFAULT_SYMBOL_NAMESPACE define
-	=== 3 How to use Symbols exported in Namespaces
-	=== 4 Loading Modules that use namespaced Symbols
-	=== 5 Automatically creating MODULE_IMPORT_NS statements
-
-1. Introduction
-===============
+Introduction
+============
 
 Symbol Namespaces have been introduced as a means to structure the export
 surface of the in-kernel API. It allows subsystem maintainers to partition
@@ -31,15 +21,15 @@ its configuration, reject loading the module or warn about a missing import.
 Additionally, it is possible to put symbols into a module namespace, strictly
 limiting which modules are allowed to use these symbols.
 
-2. How to define Symbol Namespaces
-==================================
+How to define Symbol Namespaces
+===============================
 
 Symbols can be exported into namespace using different methods. All of them are
 changing the way EXPORT_SYMBOL and friends are instrumented to create ksymtab
 entries.
 
-2.1 Using the EXPORT_SYMBOL macros
-==================================
+Using the EXPORT_SYMBOL macros
+------------------------------
 
 In addition to the macros EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL(), that allow
 exporting of kernel symbols to the kernel symbol table, variants of these are
@@ -57,8 +47,8 @@ refer to ``NULL``. There is no default namespace if none is defined. ``modpost``
 and kernel/module/main.c make use the namespace at build time or module load
 time, respectively.
 
-2.2 Using the DEFAULT_SYMBOL_NAMESPACE define
-=============================================
+Using the DEFAULT_SYMBOL_NAMESPACE define
+-----------------------------------------
 
 Defining namespaces for all symbols of a subsystem can be very verbose and may
 become hard to maintain. Therefore a default define (DEFAULT_SYMBOL_NAMESPACE)
@@ -86,8 +76,8 @@ unit as preprocessor statement. The above example would then read::
 within the corresponding compilation unit before the #include for
 <linux/export.h>. Typically it's placed before the first #include statement.
 
-2.3 Using the EXPORT_SYMBOL_GPL_FOR_MODULES() macro
-===================================================
+Using the EXPORT_SYMBOL_GPL_FOR_MODULES() macro
+-----------------------------------------------
 
 Symbols exported using this macro are put into a module namespace. This
 namespace cannot be imported.
@@ -102,8 +92,8 @@ For example:
 will limit usage of this symbol to modules whoes name matches the given
 patterns.
 
-3. How to use Symbols exported in Namespaces
-============================================
+How to use Symbols exported in Namespaces
+=========================================
 
 In order to use symbols that are exported into namespaces, kernel modules need
 to explicitly import these namespaces. Otherwise the kernel might reject to
@@ -125,11 +115,10 @@ inspected with modinfo::
 
 
 It is advisable to add the MODULE_IMPORT_NS() statement close to other module
-metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
-5. for a way to create missing import statements automatically.
+metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE().
 
-4. Loading Modules that use namespaced Symbols
-==============================================
+Loading Modules that use namespaced Symbols
+===========================================
 
 At module loading time (e.g. ``insmod``), the kernel will check each symbol
 referenced from the module for its availability and whether the namespace it
@@ -140,8 +129,8 @@ allow loading of modules that don't satisfy this precondition, a configuration
 option is available: Setting MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y will
 enable loading regardless, but will emit a warning.
 
-5. Automatically creating MODULE_IMPORT_NS statements
-=====================================================
+Automatically creating MODULE_IMPORT_NS statements
+==================================================
 
 Missing namespaces imports can easily be detected at build time. In fact,
 modpost will emit a warning if a module uses a symbol from a namespace
diff --git a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
index 6ee713988531..baa344f4523a 100644
--- a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
@@ -10,8 +10,8 @@ Questo documento descrive come usare lo spazio dei nomi dei simboli
 per strutturare quello che viene esportato internamente al kernel
 grazie alle macro della famiglia EXPORT_SYMBOL().
 
-1. Introduzione
-===============
+Introduzione
+============
 
 Lo spazio dei nomi dei simboli è stato introdotto come mezzo per strutturare
 l'API esposta internamente al kernel. Permette ai manutentori di un
@@ -24,15 +24,15 @@ devono prima importare detto spazio. Altrimenti il kernel, a seconda
 della configurazione, potrebbe rifiutare di caricare il modulo o
 avvisare l'utente di un'importazione mancante.
 
-2. Come definire uno spazio dei nomi dei simboli
-================================================
+Come definire uno spazio dei nomi dei simboli
+=============================================
 
 I simboli possono essere esportati in spazi dei nomi usando diversi
 meccanismi.  Tutti questi meccanismi cambiano il modo in cui
 EXPORT_SYMBOL e simili vengono guidati verso la creazione di voci in ksymtab.
 
-2.1 Usare le macro EXPORT_SYMBOL
-================================
+Usare le macro EXPORT_SYMBOL
+----------------------------
 
 In aggiunta alle macro EXPORT_SYMBOL() e EXPORT_SYMBOL_GPL(), che permettono
 di esportare simboli del kernel nella rispettiva tabella, ci sono
@@ -53,8 +53,8 @@ di base. Il programma ``modpost`` e il codice in kernel/module/main.c usano lo
 spazio dei nomi, rispettivamente, durante la compilazione e durante il
 caricamento di un modulo.
 
-2.2 Usare il simbolo di preprocessore DEFAULT_SYMBOL_NAMESPACE
-==============================================================
+Usare il simbolo di preprocessore DEFAULT_SYMBOL_NAMESPACE
+----------------------------------------------------------
 
 Definire lo spazio dei nomi per tutti i simboli di un sottosistema può essere
 logorante e di difficile manutenzione. Perciò è stato fornito un simbolo
@@ -83,8 +83,8 @@ direttamente nei file da compilare. L'esempio precedente diventerebbe::
 
 Questo va messo prima di un qualsiasi uso di EXPORT_SYMBOL.
 
-3. Come usare i simboli esportati attraverso uno spazio dei nomi
-================================================================
+Come usare i simboli esportati attraverso uno spazio dei nomi
+=============================================================
 
 Per usare i simboli esportati da uno spazio dei nomi, i moduli del
 kernel devono esplicitamente importare il relativo spazio dei nomi; altrimenti
@@ -108,12 +108,10 @@ modinfo::
 
 
 Si consiglia di posizionare la dichiarazione MODULE_IMPORT_NS() vicino
-ai metadati del modulo come MODULE_AUTHOR() o MODULE_LICENSE(). Fate
-riferimento alla sezione 5. per creare automaticamente le importazioni
-mancanti.
+ai metadati del modulo come MODULE_AUTHOR() o MODULE_LICENSE().
 
-4. Caricare moduli che usano simboli provenienti da spazi dei nomi
-==================================================================
+Caricare moduli che usano simboli provenienti da spazi dei nomi
+===============================================================
 
 Quando un modulo viene caricato (per esempio usando ``insmod``), il kernel
 verificherà la disponibilità di ogni simbolo usato e se lo spazio dei nomi
@@ -125,8 +123,8 @@ un'opzione di configurazione: impostare
 MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y caricherà i moduli comunque ma
 emetterà un avviso.
 
-5. Creare automaticamente la dichiarazione MODULE_IMPORT_NS
-===========================================================
+Creare automaticamente la dichiarazione MODULE_IMPORT_NS
+========================================================
 
 La mancanza di un'importazione può essere individuata facilmente al momento
 della compilazione. Infatti, modpost emetterà un avviso se il modulo usa
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
index b1bec219912d..d9477ccea98f 100644
--- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -14,18 +14,8 @@
 
 本文档描述了如何使用符号命名空间来构造通过EXPORT_SYMBOL()系列宏导出的内核内符号的导出面。
 
-.. 目录
-
-       === 1 简介
-       === 2 如何定义符号命名空间
-          --- 2.1 使用EXPORT_SYMBOL宏
-          --- 2.2 使用DEFAULT_SYMBOL_NAMESPACE定义
-       === 3 如何使用命名空间中导出的符号
-       === 4 加载使用命名空间符号的模块
-       === 5 自动创建MODULE_IMPORT_NS声明
-
-1. 简介
-=======
+简介
+====
 
 符号命名空间已经被引入，作为构造内核内API的导出面的一种手段。它允许子系统维护者将
 他们导出的符号划分进独立的命名空间。这对于文档的编写非常有用（想想SUBSYSTEM_DEBUG
@@ -33,14 +23,14 @@
 的模块必须导入命名空间。否则，内核将根据其配置，拒绝加载该模块或警告说缺少
 导入。
 
-2. 如何定义符号命名空间
-=======================
+如何定义符号命名空间
+====================
 
 符号可以用不同的方法导出到命名空间。所有这些都在改变 EXPORT_SYMBOL 和与之类似的那些宏
 被检测到的方式，以创建 ksymtab 条目。
 
-2.1 使用EXPORT_SYMBOL宏
-=======================
+使用EXPORT_SYMBOL宏
+-------------------
 
 除了允许将内核符号导出到内核符号表的宏EXPORT_SYMBOL()和EXPORT_SYMBOL_GPL()之外，
 这些宏的变体还可以将符号导出到某个命名空间：EXPORT_SYMBOL_NS() 和 EXPORT_SYMBOL_NS_GPL()。
@@ -54,8 +44,8 @@
 导出时未指明命名空间的符号将指向 ``NULL`` 。如果没有定义命名空间，则默认没有。
 ``modpost`` 和kernel/module/main.c分别在构建时或模块加载时使用名称空间。
 
-2.2 使用DEFAULT_SYMBOL_NAMESPACE定义
-====================================
+使用DEFAULT_SYMBOL_NAMESPACE定义
+--------------------------------
 
 为一个子系统的所有符号定义命名空间可能会非常冗长，并可能变得难以维护。因此，我
 们提供了一个默认定义（DEFAULT_SYMBOL_NAMESPACE），如果设置了这个定义， 它将成
@@ -80,8 +70,8 @@
 
 应置于相关编译单元中任何 EXPORT_SYMBOL 宏之前
 
-3. 如何使用命名空间中导出的符号
-===============================
+如何使用命名空间中导出的符号
+============================
 
 为了使用被导出到命名空间的符号，内核模块需要明确地导入这些命名空间。
 否则内核可能会拒绝加载该模块。模块代码需要使用宏MODULE_IMPORT_NS来
@@ -100,11 +90,10 @@
 
 
 建议将 MODULE_IMPORT_NS() 语句添加到靠近其他模块元数据定义的地方，
-如 MODULE_AUTHOR() 或 MODULE_LICENSE() 。关于自动创建缺失的导入
-语句的方法，请参考第5节。
+如 MODULE_AUTHOR() 或 MODULE_LICENSE() 。
 
-4. 加载使用命名空间符号的模块
-=============================
+加载使用命名空间符号的模块
+==========================
 
 在模块加载时（比如 ``insmod`` ），内核将检查每个从模块中引用的符号是否可
 用，以及它可能被导出到的名字空间是否被模块导入。内核的默认行为是拒绝
@@ -113,8 +102,8 @@ EINVAL方式失败。要允许加载不满足这个前提条件的模块，可
 设置 MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y 将使加载不受影响，但会
 发出警告。
 
-5. 自动创建MODULE_IMPORT_NS声明
-===============================
+自动创建MODULE_IMPORT_NS声明
+============================
 
 缺少命名空间的导入可以在构建时很容易被检测到。事实上，如果一个模块
 使用了一个命名空间的符号而没有导入它，modpost会发出警告。
-- 
2.43.0


